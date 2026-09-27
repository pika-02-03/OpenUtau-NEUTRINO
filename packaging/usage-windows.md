### Windows (x64、未確認)

Windows版は自動でビルドしているだけで、実機では一度も動かしていません。手順も確認していません。

1. **このビルドをダウンロード**: [OpenUtau-NEUTRINO-win-x64.zip](https://github.com/{{BUILD_REPO}}/releases/latest/download/OpenUtau-NEUTRINO-win-x64.zip) をクリックすると最新版がダウンロードされます(一覧は [Releases](https://github.com/{{BUILD_REPO}}/releases/latest))。
2. **NEUTRINOをダウンロード**: [NEUTRINO公式サイト](https://studio-neutrino.com/) から Windows 版の本体(v3.2以上)と歌声モデルをダウンロードし、前提条件の形に展開します。すでに持っていれば不要です。
3. ダウンロードした zip を右クリックして「プロパティ」を開き、下の方に「許可する」のチェックがあればオンにして OK を押します。そのあと zip を右クリックして「すべて展開」します。展開したフォルダがそのまま OpenUtau の設定フォルダになります。
4. フォルダ内の `register-neutrino.bat` をダブルクリックします。NEUTRINOのフォルダをそのウィンドウへドラッグしてEnterを押すと、`model\` の中の歌声がすべて登録されます。管理者権限は要りません。「Windows によって PC が保護されました」と出たら、「詳細情報」→「実行」で進めます。
5. `OpenUtau.exe` を起動し、トラックの歌手で「ZUNDAMON (NEUTRINO)」などを選びます。
6. ピアノロールに音符と歌詞を入れて再生します。

登録スクリプトは NEUTRINO 本体とモデルに書き込みません。展開したフォルダの中に `Dependencies\NEUTRINO_v3`(NEUTRINOへのジャンクション)と `Singers\NEUTRINO_<モデル名>\`(モデルのハードリンク。別ドライブならコピー)と歌手設定を作るだけです。
