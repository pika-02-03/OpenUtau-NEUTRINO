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
