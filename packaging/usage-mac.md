### Mac (Apple Silicon)

1. **このビルドをダウンロード**: [OpenUtau-NEUTRINO-macos-arm64.dmg](https://github.com/{{BUILD_REPO}}/releases/latest/download/OpenUtau-NEUTRINO-macos-arm64.dmg) をクリックすると最新版がダウンロードされます(一覧は [Releases](https://github.com/{{BUILD_REPO}}/releases/latest))。
2. **NEUTRINOをダウンロード**: [NEUTRINO公式サイト](https://studio-neutrino.com/) から Mac 版の本体と、使いたい歌声モデル(ずんだもん等)をダウンロードし、本体の説明どおりに展開します。展開したフォルダの中に `bin` と `model` があればOKです。場所はどこでも構いません。
3. ダウンロードした dmg を開き、`OpenUtau.app` を隣の Applications へドラッグします。
4. ターミナル(Launchpad や Spotlight で「ターミナル」と検索すると出ます)を開き、次の1行を貼り付けて Enter を押します。署名のない配布物なので、これをしないと「壊れている」と表示されて開けません。本家OpenUtauの配布版と同じ手順です。
   ```
   xattr -rc /Applications/OpenUtau.app
   ```
5. dmgを開いたまま、ターミナルで次の1行を実行します。NEUTRINOのフォルダをそのウィンドウへドラッグしてEnterを押すと、`model/` の中の歌声がすべて登録されます。
   ```
   bash /Volumes/OpenUtau-NEUTRINO/NEUTRINOを登録.command
   ```
6. OpenUtauを起動し、トラックの歌手で「ZUNDAMON (NEUTRINO)」などを選びます。音素変換器とレンダラは自動で「NEUTRINO」になります。
7. ピアノロールに音符と歌詞を入れて再生します。MusicXMLはウィンドウへドラッグすれば読み込めます。読み込み後に歌手が空なら選び直してください。

登録スクリプトは NEUTRINO 本体とモデルに書き込みません。`~/Library/OpenUtau/` の `Dependencies/NEUTRINO_v3`(NEUTRINOへのリンク)と `Singers/NEUTRINO_<モデル名>/`(モデルへのリンクと歌手設定)を作るだけで、元に戻す時はこの2か所を消します。
