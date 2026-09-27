### 前提条件

使う前に、次の条件をすべて満たしている必要があります。

| 項目 | 条件 |
|---|---|
| パソコン | Mac は Apple Silicon (M1以降)。Windows は 10 / 11 の 64bit (x64)。Intel Mac と ARM 版 Windows は非対応です。 |
| NEUTRINO 本体 | **v3.2 以上 v4 未満**を、[NEUTRINO公式サイト](https://studio-neutrino.com/) から入手して展開済みであること。**自分の OS 用の版**(Mac なら Mac 版、Windows なら Windows 版)が必要です。v2 系と v4 以降は使えません。 |
| 歌声モデル | 使いたいモデル(ずんだもん等)を NEUTRINO 本体の `model` フォルダに入れてあること。本体と同じ v3 系のモデルが必要です。 |
| フォルダの形 | 公式の配布物をそのまま展開した形であること。NEUTRINO フォルダの中に `bin`・`model`・`settings` があり、`bin` に実行ファイル(Mac は `neutrino`、Windows は `NEUTRINO.exe`)があります。 |
| そのほか | GPU・Python・.NET などの追加インストールは要りません。NEUTRINO 自体の動作条件と利用規約は公式サイトに従ってください。 |

動作を確かめたのは Mac (Apple Silicon) + NEUTRINO Tau v3.2.2 + ZUNDAMON v3.2.2 だけです。Windows と、ほかのバージョン・モデルは確かめていません。

