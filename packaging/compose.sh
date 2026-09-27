#!/usr/bin/env bash
# 使い方の部品から、Release本文(all)・Mac同梱README(mac)・Windows同梱README(windows)を組み立てる。
# 使い方: compose.sh all|mac|windows|readme  (環境変数 SOURCE_REPO SOURCE_REF SOURCE_SHA SOURCE_DATE)
set -euo pipefail
d=$(cd "$(dirname "$0")" && pwd)
case "$1" in
  all)     parts="header requirements usage-mac usage-windows usage-common"; title="" ;;
  readme)  parts="readme-top header requirements usage-mac usage-windows usage-common readme-bottom"; title="" ;;
  mac)     parts="header requirements usage-mac usage-common"; title="# OpenUtau NEUTRINO対応版 (Mac, Apple Silicon)" ;;
  windows) parts="header requirements usage-windows usage-common"; title="# OpenUtau NEUTRINO対応版 (Windows x64、未確認)" ;;
  *) echo "usage: $0 all|mac|windows|readme" >&2; exit 2 ;;
esac
{
  [ -n "$title" ] && printf '%s\n\n' "$title"
  for p in $parts; do
    case "$p" in requirements) { [ "$1" = all ] || [ "$1" = readme ]; } && echo "## 導入方法" && echo ;; esac
    cat "$d/$p.md"; echo
  done
} | sed -e "s#{{SOURCE_REPO}}#${SOURCE_REPO}#g" -e "s#{{SOURCE_REF}}#${SOURCE_REF}#g" \
        -e "s#{{SOURCE_SHA}}#${SOURCE_SHA}#g" -e "s#{{SOURCE_SHORT}}#${SOURCE_SHA:0:8}#g" \
        -e "s#{{SOURCE_DATE}}#${SOURCE_DATE}#g" -e "s#{{BUILD_REPO}}#${BUILD_REPO:-${GITHUB_REPOSITORY:?BUILD_REPO or GITHUB_REPOSITORY}}#g" \
  | awk 'BEGIN{h=0} /^## 導入方法$/{if(h++)next} {print}'
