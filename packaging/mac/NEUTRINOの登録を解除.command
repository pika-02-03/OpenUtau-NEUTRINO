#!/bin/bash
# 「NEUTRINOを登録」で作ったものだけを OpenUtau から外す。NEUTRINO 本体・モデル・OpenUtau の作品には触れない。
set -eu
OU="$HOME/Library/OpenUtau"
link="$OU/Dependencies/NEUTRINO_v3"
if [ -L "$link" ]; then rm "$link"; echo "外しました: NEUTRINO へのリンク"; fi   # リンクだけ消す (リンク先は消えない)
n=0
for d in "$OU/Singers"/NEUTRINO_*; do
  [ -d "$d" ] && grep -q "singer_type: neutrino" "$d/character.yaml" 2>/dev/null || continue
  rm -rf "$d"; echo "外しました: $(basename "$d")"; n=$((n+1))   # 中身はモデルへのリンクと設定ファイルだけ
done
echo "完了 (歌手 $n 件)。OpenUtau 本体を消す時は、アプリケーションフォルダの OpenUtau.app をゴミ箱へ入れてください。"
