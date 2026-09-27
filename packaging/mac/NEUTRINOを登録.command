#!/bin/bash
# NEUTRINO (v3.2 以上の Mac 版) を OpenUtau から使えるようにする。
# NEUTRINO 本体とモデルには書き込まず、OpenUtau 側にリンクと設定ファイルを置くだけ。
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
OU="$HOME/Library/OpenUtau"
mkdir -p "$OU/Dependencies" "$OU/Singers"
if [ -e "$OU/Dependencies/NEUTRINO_v3" ] && [ ! -L "$OU/Dependencies/NEUTRINO_v3" ]; then
  echo "$OU/Dependencies/NEUTRINO_v3 が既にあります。中身を確認してから消して、もう一度実行してください。"; exit 1
fi
ln -sfn "$NE" "$OU/Dependencies/NEUTRINO_v3"
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
echo "完了。OpenUtau を起動し直してください。"
