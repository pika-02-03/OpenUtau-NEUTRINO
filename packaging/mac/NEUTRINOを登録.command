#!/bin/bash
# NEUTRINO (v3.2 以上の Mac 版) を OpenUtau から使えるようにする。
# 1) OpenUtau と NEUTRINO から「ネットから来たファイル」の印を外す (署名が無いため macOS に止められるのを防ぐ。中身は変えない)
# 2) OpenUtau 側に NEUTRINO へのリンクと歌手の設定ファイルを置く (NEUTRINO 本体とモデルには書き込まない)
set -eu
NE="${1:-}"
if [ -z "$NE" ]; then
  echo "NEUTRINO のフォルダをこのウィンドウへドラッグして、Enter を押してください。"
  read -r NE
fi
NE=$(printf '%s' "$NE" | sed -e 's/\\ / /g' -e "s/^[ '\"]*//" -e "s/[ '\"]*\$//" -e 's:/*$::')
if [ ! -f "$NE/bin/neutrino" ] || [ ! -d "$NE/model" ]; then
  echo "NEUTRINO のフォルダではないようです (bin/neutrino と model/ がありません): $NE"; exit 1
fi
for app in /Applications/OpenUtau.app "$HOME/Applications/OpenUtau.app"; do
  if [ -d "$app" ]; then xattr -dr com.apple.quarantine "$app" 2>/dev/null || true; echo "警告の印を外しました: $app"; fi
done
xattr -dr com.apple.quarantine "$NE" 2>/dev/null || true
echo "警告の印を外しました: $NE"
OU="$HOME/Library/OpenUtau"
mkdir -p "$OU/Dependencies" "$OU/Singers"
if [ -e "$OU/Dependencies/NEUTRINO_v3" ] && [ ! -L "$OU/Dependencies/NEUTRINO_v3" ]; then
  echo "$OU/Dependencies/NEUTRINO_v3 が既にあります。中身を確認してから消して、もう一度実行してください。"; exit 1
fi
ln -sfn "$NE" "$OU/Dependencies/NEUTRINO_v3"
# model/ から消えたモデルの登録を片付ける (この仕組みで作った NEUTRINO_* だけ)
for d in "$OU/Singers"/NEUTRINO_*; do
  [ -d "$d" ] && grep -q "singer_type: neutrino" "$d/character.yaml" 2>/dev/null || continue
  name=$(basename "$d"); name=${name#NEUTRINO_}
  if [ ! -f "$NE/model/$name/info.toml" ]; then rm -rf "$d"; echo "モデルが無いので登録を外しました: $name"; fi
done
n=0
for m in "$NE"/model/*; do
  [ -f "$m/info.toml" ] || continue
  name=$(basename "$m"); d="$OU/Singers/NEUTRINO_$name"
  mkdir -p "$d"
  for f in "$m"/*; do ln -sfn "$f" "$d/$(basename "$f")"; done
  printf 'name=%s (NEUTRINO)\n' "$name" > "$d/character.txt"
  printf 'singer_type: neutrino\ntext_file_encoding: utf-8\ndefault_phonemizer: OpenUtau.Core.Neutrino.NeutrinoLabelPhonemizer\n' > "$d/character.yaml"
  echo "登録しました: $name (NEUTRINO)"; n=$((n+1))
done
[ "$n" -gt 0 ] || { echo "model/ の中に歌声モデルが見つかりませんでした。"; exit 1; }
echo "完了。OpenUtau を起動してください (開いていた場合は一度終了してから)。"
