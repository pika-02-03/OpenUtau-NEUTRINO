# OpenUtau NEUTRINO対応版 (非公式ビルド)

歌声エディタ [OpenUtau](https://github.com/openutau/OpenUtau) で [NEUTRINO](https://studio-neutrino.com/) の歌声(ずんだもん等)を鳴らし、画面で音程・歌詞・ピッチカーブ・ビブラートを直せるようにしたビルドを配布しています。

## ダウンロード

- **Mac (Apple Silicon)**: [OpenUtau-NEUTRINO-macos-arm64.dmg](../../releases/latest/download/OpenUtau-NEUTRINO-macos-arm64.dmg)
- **Windows (x64、未確認)**: [OpenUtau-NEUTRINO-win-x64.zip](../../releases/latest/download/OpenUtau-NEUTRINO-win-x64.zip)
- 過去の版と更新内容: [Releases](../../releases)

## このビルドについて


歌声エディタ OpenUtau で NEUTRINO の歌声(ずんだもん等)を鳴らし、画面で音程・歌詞・ピッチカーブ・ビブラートを直せるようにした非公式ビルドです。

- ソース: rokujyushi/OpenUtau の `neutrino` ブランチ、コミット [`203c44f5`](https://github.com/rokujyushi/OpenUtau/commit/203c44f5d1374697abfa69626a2b52a19627184b)(2026-09-13)。本家へのPR [openutau/OpenUtau#2136](https://github.com/openutau/OpenUtau/pull/2136)(作者 rokujyushi さん、未マージ)の中身です。
- 公式の配布物ではなく、本家とも作者とも無関係な個人ビルドです。OpenUtauはMITライセンスです。
- ソースには手を加えていません。例外はアプリの更新確認だけで、本家版(NEUTRINO非対応)へ上書きされないよう、確認先をこの配布元に差し替えています。
- NEUTRINO本体と歌声モデルは入っていません。v3.2以上を [NEUTRINO公式サイト](https://studio-neutrino.com/) から各自入手してください。GPUは要りません。
- 動作確認は Mac (Apple Silicon) + NEUTRINO Tau v3.2.2 + ZUNDAMON v3.2.2 だけです。ほかのモデルは登録できることだけ確認しています。

## 導入方法

### Mac (Apple Silicon)

1. `OpenUtau-NEUTRINO-macos-arm64.dmg` を開き、`OpenUtau.app` を隣の Applications へドラッグします。
2. ターミナルで次の1行を実行します。署名のない配布物なので、これをしないと「壊れている」と表示されて開けません。本家OpenUtauの配布版と同じ手順です。
   ```
   xattr -rc /Applications/OpenUtau.app
   ```
3. dmgを開いたまま、ターミナルで次の1行を実行します。NEUTRINOのフォルダをそのウィンドウへドラッグしてEnterを押すと、`model/` の中の歌声がすべて登録されます。
   ```
   bash /Volumes/OpenUtau-NEUTRINO/NEUTRINOを登録.command
   ```
4. OpenUtauを起動し、トラックの歌手で「ZUNDAMON (NEUTRINO)」などを選びます。音素変換器とレンダラは自動で「NEUTRINO」になります。
5. ピアノロールに音符と歌詞を入れて再生します。MusicXMLはウィンドウへドラッグすれば読み込めます。読み込み後に歌手が空なら選び直してください。

登録スクリプトは NEUTRINO 本体とモデルに書き込みません。`~/Library/OpenUtau/` の `Dependencies/NEUTRINO_v3`(NEUTRINOへのリンク)と `Singers/NEUTRINO_<モデル名>/`(モデルへのリンクと歌手設定)を作るだけで、元に戻す時はこの2か所を消します。


### Windows (x64、未確認)

Windows版は自動でビルドしているだけで、実機では一度も動かしていません。手順も確認していません。

1. `OpenUtau-NEUTRINO-win-x64.zip` を展開します。展開したフォルダがそのまま OpenUtau の設定フォルダになります。
2. フォルダ内の `register-neutrino.bat` をダブルクリックします。NEUTRINOのフォルダをそのウィンドウへドラッグしてEnterを押すと、`model\` の中の歌声がすべて登録されます。管理者権限は要りません。
3. `OpenUtau.exe` を起動し、トラックの歌手で「ZUNDAMON (NEUTRINO)」などを選びます。
4. ピアノロールに音符と歌詞を入れて再生します。

登録スクリプトは NEUTRINO 本体とモデルに書き込みません。展開したフォルダの中に `Dependencies\NEUTRINO_v3`(NEUTRINOへのジャンクション)と `Singers\NEUTRINO_<モデル名>\`(モデルのハードリンク。別ドライブならコピー)と歌手設定を作るだけです。

### 音程が定規で引いたようになる時

既定のままだと、NEUTRINOが作った自然な音程カーブの代わりに、画面上の直線的なピッチ線で歌います。

- **レンダリング済みピッチの読み込み**(おすすめ): 一度再生したあと、音符を全選択し、ノートメニューの「レンダリング済みピッチの読み込み」を実行します。NEUTRINOのカーブが編集できる線として取り込まれ、その上からしゃくりやビブラートを足せます。音符の長さや歌詞を変えたら、その部分だけ読み込み直します。
- **direct をオン**: 表情パラメータの direct をオンにすると、NEUTRINOのカーブをそのまま使います。そのかわり画面で描いたピッチやビブラートは効きません。

## 自動更新の仕組み

このブランチ (`release-kit`) には配布用の設定だけがあり、OpenUtau のソースは持っていません。ビルドはすべて GitHub Actions の Mac / Windows マシンで行っています。

- 毎日 06:00 (日本時間) に [`.github/workflows/release.yml`](.github/workflows/release.yml) が `neutrino` ブランチの最新コミットを確かめます。前回の配布から変わっていれば、Mac 版と Windows 版をビルドして新しい Release を出します。
- PR が本家にマージされたら、ビルドせずに本家の Release ページへのリンクを出し、自動ビルドを止めます。
- 使い方の文章は [`packaging/`](packaging) の部品1か所にあり、この README・Release 本文・配布物に同梱の説明書は、そこから組み立てています。
- 最後に配布したソースは [`state/last-build.json`](state/last-build.json) に記録しています。

