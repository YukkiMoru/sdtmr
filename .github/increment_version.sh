#!/bin/bash

# 最新のタグを取得
latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)

# タグが存在しない場合は初期バージョンを設定
if [ -z "$latest_tag" ]; then
  new_tag="v1.1.1"
else
  # バージョン番号をインクリメント
  IFS='.' read -r -a parts <<< "${latest_tag#v}"
  parts[2]=$((parts[2] + 1))
  new_tag="v${parts[0]}.${parts[1]}.${parts[2]}"
fi

# 新しいタグを出力
echo $new_tag