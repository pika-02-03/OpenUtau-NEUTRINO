## 自動更新の仕組み

このブランチ (`release-kit`) には配布用の設定だけがあり、OpenUtau のソースは持っていません。ビルドはすべて GitHub Actions の Mac / Windows マシンで行っています。

- 毎日 06:00 (日本時間) に [`.github/workflows/release.yml`](.github/workflows/release.yml) が `neutrino` ブランチの最新コミットを確かめます。前回の配布から変わっていれば、Mac 版と Windows 版をビルドして新しい Release を出します。
- PR が本家にマージされたら、ビルドせずに本家の Release ページへのリンクを出し、自動ビルドを止めます。
- 使い方の文章は [`packaging/`](packaging) の部品1か所にあり、この README・Release 本文・配布物に同梱の説明書は、そこから組み立てています。
- 最後に配布したソースは [`state/last-build.json`](state/last-build.json) に記録しています。
