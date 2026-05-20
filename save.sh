#!/bin/bash
set -e

cd "$(dirname "$0")"

if [ -z "$(git status --porcelain)" ]; then
  echo "変更なし。スキップします。"
  exit 0
fi

MSG="${1:-Update $(date '+%Y-%m-%d %H:%M')}"

git add -A
git commit -m "$MSG"
git push

echo "GitHubに保存しました: $MSG"
