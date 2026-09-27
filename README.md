# OpenUtau NEUTRINO対応版 (非公式ビルド)

歌声エディタ [OpenUtau](https://github.com/openutau/OpenUtau) で [NEUTRINO](https://studio-neutrino.com/) の歌声(ずんだもん等)を鳴らし、画面で音程・歌詞・ピッチカーブ・ビブラートを直せるようにしたビルドを配布しています。

**ダウンロードと使い方は [最新の Release](../../releases/latest) にあります。** Mac (Apple Silicon) 版と Windows (x64、未確認) 版があります。

- 中身は本家へのPR [openutau/OpenUtau#2136](https://github.com/openutau/OpenUtau/pull/2136)(作者 rokujyushi さん、未マージ)の [`neutrino` ブランチ](https://github.com/rokujyushi/OpenUtau/tree/neutrino) を、そのままビルドしたものです。
- 公式の配布物ではなく、本家とも作者とも無関係な個人ビルドです。OpenUtau は MIT ライセンスです。
- NEUTRINO 本体と歌声モデルは入っていません。各自で公式サイトから入手してください。

## 自動更新の仕組み

このブランチ (`release-kit`) には配布用の設定だけがあり、OpenUtau のソースは持っていません。

- 毎日 06:00 (日本時間) に [`.github/workflows/release.yml`](.github/workflows/release.yml) が `neutrino` ブランチの最新コミットを確かめます。前回の配布から変わっていれば、Mac 版と Windows 版をビルドして新しい Release を出します。
- ソースへの変更は、アプリの更新確認の問い合わせ先をこの配布元へ差し替える1行だけです。本家版(NEUTRINO非対応)へ上書きされるのを防ぐためです。
- PR が本家にマージされたら、ビルドせずに本家の Release ページへのリンクを出し、自動ビルドを止めます。
- 最後に配布したソースは [`state/last-build.json`](state/last-build.json) に記録しています。
