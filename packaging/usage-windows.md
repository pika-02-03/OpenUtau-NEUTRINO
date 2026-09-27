### Windows (x64、未確認)

Windows版は自動でビルドしているだけで、実機では一度も動かしていません。手順も確認していません。

1. `OpenUtau-NEUTRINO-win-x64.zip` を展開します。展開したフォルダがそのまま OpenUtau の設定フォルダになります。
2. フォルダ内の `register-neutrino.bat` をダブルクリックします。NEUTRINOのフォルダをそのウィンドウへドラッグしてEnterを押すと、`model\` の中の歌声がすべて登録されます。管理者権限は要りません。
3. `OpenUtau.exe` を起動し、トラックの歌手で「ZUNDAMON (NEUTRINO)」などを選びます。
4. ピアノロールに音符と歌詞を入れて再生します。

登録スクリプトは NEUTRINO 本体とモデルに書き込みません。展開したフォルダの中に `Dependencies\NEUTRINO_v3`(NEUTRINOへのジャンクション)と `Singers\NEUTRINO_<モデル名>\`(モデルのハードリンク。別ドライブならコピー)と歌手設定を作るだけです。
