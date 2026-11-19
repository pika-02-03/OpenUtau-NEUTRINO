# OpenUtau NEUTRINO対応版(非公式)

本家 [OpenUtau](https://github.com/openutau/OpenUtau) に、rokujyushi さんの NEUTRINO 対応と、この版で足した機能を重ねた非公式ビルドです。

**画面**: ずんだもん(NEUTRINO)の歌を編集している所。

<img src="docs/screenshot.webp" alt="OpenUtau でずんだもん (NEUTRINO) を編集している画面">

<br>

## ダウンロード

| | 中身 | Mac | Windows(動作未確認) |
|---|---|---|---|
| **固定版** | OpenUtau 0.1.570.3。NEUTRINO 対応の PR のまま | [dmg](https://github.com/pika-02-03/OpenUtau-NEUTRINO/releases/latest/download/OpenUtau-NEUTRINO-macos-arm64.dmg) | [zip](https://github.com/pika-02-03/OpenUtau-NEUTRINO/releases/latest/download/OpenUtau-NEUTRINO-win-x64.zip) |
| **最新版** | 本家の最新 0.1.577.11 を混ぜた物。動作保証なし | [dmg](https://github.com/pika-02-03/OpenUtau-NEUTRINO/releases/latest/download/OpenUtau-NEUTRINO-latest-macos-arm64.dmg) | [zip](https://github.com/pika-02-03/OpenUtau-NEUTRINO/releases/latest/download/OpenUtau-NEUTRINO-latest-win-x64.zip) |

入れるのはどちらか一方です。
前に出した版は [Releases](https://github.com/pika-02-03/OpenUtau-NEUTRINO/releases) に残しています(名前に中の OpenUtau の版)。動かなくなった時は、そこから前の版を入れ直してください。

## 入れ方

**用意する物**

| 物 | どこから |
|---|---|
| この OpenUtau(Mac は dmg、Windows は zip) | [Releases](https://github.com/pika-02-03/OpenUtau-NEUTRINO/releases/latest) |
| NEUTRINO 本体(v3.2 以上) | [NEUTRINO 公式](https://studio-neutrino.com/)。この配布には入っていない |

**「NEUTRINO のフォルダ」**: NEUTRINO の zip を展開すると出てくるフォルダ。開いて `bin` と `model` が見えれば、それです。

```
NEUTRINO      ← これが「NEUTRINO のフォルダ」
├── bin
├── model     ← 歌声モデル (ZUNDAMON など) が 1 つずつ入っている
├── score
└── …
```

- 開いても `bin` と `model` が無く、フォルダが 1 つだけ入っている時は、その中が NEUTRINO のフォルダ。
- 登録した後にこのフォルダを動かしたり名前を変えたりすると歌えなくなる。先に置き場所を決めておく(動かした時は登録をやり直す)。

### Mac

1. **NEUTRINO を置く**: NEUTRINO の zip をダブルクリックで展開し、NEUTRINO のフォルダをホーム(Finder で ⌘+Shift+H を押すと開く、家のマークのフォルダ)など、消さない場所へ移す。
2. **OpenUtau を入れる**: この配布の dmg を開き、`OpenUtau.app` を隣の `Applications` へドラッグする。
3. **ターミナルを開く**: ⌘+スペースを押し、「ターミナル」と打って Enter。
4. **登録スクリプトを動かす**: ターミナルに `bash `(bash と空白 1 つ)と打ち、dmg の中の `NEUTRINOを登録.command` をターミナルへドラッグして Enter。
5. **NEUTRINO のフォルダを渡す**: 「NEUTRINO のフォルダをこのウィンドウへドラッグして、Enter を押してください。」と出たら、手順 1 の NEUTRINO のフォルダをターミナルへドラッグして Enter。
6. **終わり**: 「完了。」と出たら OpenUtau を起動する。歌手の一覧に `ZUNDAMON (NEUTRINO)` のように、モデルの名前 + `(NEUTRINO)` で並ぶ。

途中で「アクセスを許可しますか」と聞かれたら「許可」を押す。

**うまくいかない時**

| こうなった | 直し方 |
|---|---|
| `NEUTRINO のフォルダではないようです` と出る | 渡したフォルダが違う。開いて `bin` と `model` が見えるフォルダで手順 4 から |
| `model/ の中に歌声モデルが見つかりませんでした` と出る | `model` の中が空。NEUTRINO 公式から歌声モデルを入れて手順 4 から |
| OpenUtau を開こうとすると止められる | 手順 2 の前に手順 4 をした。手順 4 からやり直す |

歌声モデルを足した時や NEUTRINO のフォルダを動かした時も、手順 3〜5 をもう一度。

登録スクリプトは、OpenUtau と NEUTRINO から「ネットから来たファイル」の印を外し(署名が無いので、そのままだと macOS に止められる)、`~/Library/OpenUtau` に NEUTRINO へのリンクと歌手を作ります。NEUTRINO 本体とモデルには書き込みません。外す時は、dmg の `NEUTRINOの登録を解除.command` を同じように動かします(NEUTRINO・モデル・作品は消えません)。

### Windows

1. **NEUTRINO を置く**: NEUTRINO の zip を右クリック →「すべて展開」。NEUTRINO のフォルダを `C:\NEUTRINO` など、消さない場所へ移す。
2. **OpenUtau を置く**: この配布の zip も右クリック →「すべて展開」。出てきたフォルダが、そのまま OpenUtau 本体(好きな場所へ移してよい)。zip をダブルクリックで開いただけの状態では、中の物を動かさない。
3. **登録スクリプトを動かす**: 手順 2 のフォルダの `register-neutrino.bat` をダブルクリックする(黒い画面が開く)。警告が出たら「詳細情報」→「実行」(または「実行」)。
4. **NEUTRINO のフォルダを渡す**: 「NEUTRINO のフォルダをこのウィンドウへドラッグして、Enter を押してください。」と出たら、手順 1 の NEUTRINO のフォルダを黒い画面へドラッグして Enter。
5. **終わり**: 「完了。」と出たら、手順 2 のフォルダの `OpenUtau.exe` を起動する。歌手の一覧に `ZUNDAMON (NEUTRINO)` のように、モデルの名前 + `(NEUTRINO)` で並ぶ。

管理者の権限は要りません。

**うまくいかない時**

| こうなった | 直し方 |
|---|---|
| `NEUTRINO のフォルダではないようです` と出る | 渡したフォルダが違う。開いて `bin` と `model` が見えるフォルダで手順 3 から |
| `model\ の中に歌声モデルが見つかりませんでした` と出る | `model` の中が空。NEUTRINO 公式から歌声モデルを入れて手順 3 から |
| 赤い字で `register-neutrino.ps1` が無いと出る | zip を展開せずに開いている。手順 2 の「すべて展開」から |

歌声モデルを足した時や NEUTRINO のフォルダを動かした時も、手順 3〜4 をもう一度。

登録スクリプトは、OpenUtau と NEUTRINO のファイルのブロックを外し(署名が無いので、そのままだと Windows に止められる)、OpenUtau のフォルダの中に NEUTRINO へのリンクと歌手を作ります。NEUTRINO 本体とモデルには書き込みません。外す時は `unregister-neutrino.bat` を同じように動かします(NEUTRINO・モデル・作品は消えません)。

手で入れる時は、[rokujyushi さんの wiki](https://github.com/rokujyushi/OpenUtau/wiki/OpenUtau%E2%80%90for%E2%80%90NEUTRINO) のとおりです(アプリ名は `OpenUtau`)。

## 使い方

- **画面なしで書き出す**: `OpenUtau render --input x.ustx --output x.wav`。オプションは [CLI の説明](https://github.com/pika-02-03/OpenUtau-NEUTRINO/blob/release-kit/docs/cli.md)。
- **補足**: VOICEVOX の声で歌わせる時は、VOICEVOX のアプリを裏で起動しておく(起動していないと動かない)。

## 足した機能

題にリンクがある物は、表の下に設定する所と実測があります。

| 機能 | これまで(元の PR・本家) | この版では |
|---|---|---|
| [**v3 の声で声色・明るさを変える(mel 編集)**](#mel)<br>[7b8ebd79](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/7b8ebd790b6c5a7f7a91c14c339eb70f136b4d25) | ずんだもん等の NEUTRINO v3 の声に、カーブ `GENC`・`TENC` が効かない | 効く |
| **direct でも自分のビブラート・ピッチが効く**<br>[f6f6ae32](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/f6f6ae32d2e7655638e7817a247ba217676dd7a1) | direct をオンにすると、付けたビブラート・PITD が無視される | NEUTRINO の自然な音程の上に足して鳴らす |
| [**聞こえる音程が画面の線に出る**](#pitch-line)<br>[ca70f8be](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/ca70f8bedb679aba8f5994904ad2276b9ab7165a) | direct の所でも、灰色の線は OpenUtau 側の音程で、聞こえる音と食い違う | 実際に鳴る音程を描く。線を見ながら PITD を描き足せる |
| **Mac で Shift+ホイールの横スクロール**<br>[502e607c](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/502e607cf137ce42fd6a7882581ba20e4a6fca9b) | Mac では Shift を押しても縦に動く | ピアノロールとトラックの画面で横に動く |
| **画面を開かずに書き出す(CLI)**<br>[8c0789a5](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/8c0789a5f65dbf43b82039629d9e4c294adaba0b) ほか 8 本 | OpenUtau を起動しないと書き出せない | コマンド 1 行で ustx → wav(使い方は上) |
| [**句ごとに声と歌い方を選ぶ**](#teacher)<br>[59140887](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/59140887d54937c14a8c97eec0546ad8a9bced65) [01656bd2](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/01656bd2fdf8e000789cefe8f555c28ab5525afd) | 1 トラックは 1 つの声・歌い方 | 句ごとに選べる。例: VOICEVOX のずんだもんの声で、NEUTRINO の KIRITAN の歌い方 |
| **どの句をどの声・歌い方で歌うかが見える**<br>[aa61eb58](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/aa61eb58820393a82f6c7f379863cf4cc335faf9) | — | 句の上に「声 … ・ 歌い方 …」の帯が出る |
| [**歌い方の効き具合を句ごとに整える**](#style-f0)<br>[8f5116e5](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/8f5116e5478039b6162c09d8a990266038b468b8) | — | 調声の量・線の均し・語尾の落ちを、句ごとに数字で |
| **VOICEVOX の音を 44.1 kHz で受ける**<br>[6f74e0e6](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/6f74e0e6f2272baf41458a16d0d1a067877fec2d) | 24 kHz で受けて OpenUtau 側で上げるので、8 kHz より上が 10〜18 dB 削れる | 削れない |
| **44.1 kHz でない音を sinc で変換する**<br>[edce1f9f](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/edce1f9fdc783d2de0583e4da5fcfa33c2f49783) | 48 kHz の伴奏などは線形補間で、16 kHz で −11 dB・18 kHz で −21 dB 削れ、1〜2 標本遅れる | 削れず遅れない(NAudio の次の版の既定と同じ設定) |
| **VOICEVOX でカタカナの歌詞も歌う**<br>[2b58fd53](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/2b58fd53c5bd0cdd920f853050071d6c84f7384d) | カタカナの音符は黙って休符 | 歌う |
| **VOICEVOX で `あっ[a cl]`・`づ`・`ー` も歌う**<br>[e457d7d4](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/e457d7d4547153da24ebf49f80f058ebb45b9716) | 黙って休符になり無音 | 歌う(`あっ` は「あ」「っ」に分け、`ー` は前の音の母音) |

<a id="mel"></a>

### v3 の声で声色・明るさを変える(mel 編集)

ずんだもん等の NEUTRINO v3 の声でも、カーブ `GENC`(声色)・`TENC`(明るさ・強さ)が効きます。

**どこで**: ピアノロール下のカーブ欄。左の `GENC`・`TENC` を押して選び、描く。値は −100〜100、0 で変化なし。

**画面**: `GENC` を選んで(左の赤丸)、カーブを描いた所(赤枠)。音符は触らない。

<img src="docs/mel-genc.webp" width="560" alt="ピアノロール下の GENC の欄にカーブを描いた画面">

<br>

**こうすると → こうなる**(同じ句を値だけ変えて書き出し、実測)

**`GENC`(声色)**

| 値 | 声の山(フォルマント) | 聞こえ方 |
|---|---|---|
| −40 | ×1.32(+4.9 半音) | 細く若い声 |
| −20 | ×1.14(+2.2 半音) | |
| +20 | ×0.86(−2.6 半音) | |
| +40 | ×0.76(−4.7 半音) | 太く低い声。200 Hz 付近にも音が出る(+15 dB) |

- 声の高さは変えずに、声の山だけを動かす。+ で下げて太く低い声、− で上げて細く若い声。
- 向きは本家 OpenUtau の決まりどおり(100 で 12 半音下)。

**`TENC`(明るさ・強さ)**

| 値 | 全体の音量 | 4 kHz は 1 kHz よりさらに | 聞こえ方 |
|---|---|---|---|
| −100 | −7.2 dB | −6.0 dB | 小さく暗く |
| −50 | −3.7 dB | −3.0 dB | |
| +50 | +3.7 dB | +3.3 dB | |
| +100 | +7.3 dB | +6.4 dB | 大きく明るく |

- 全体の音量と一緒に、高い音ほど大きく(− なら小さく)変わる。1 kHz を軸に、1 オクターブ上がるごとに同じだけ差が付く(4 kHz は 1 kHz の 2 オクターブ上)。
- 1 kHz より低い音は、逆の向きに変わる。

**目安**: 効きが強いので、`GENC` は ±10〜20、`TENC` は ±20〜50 から。

**図**: 上の表の実測(句全体の平均スペクトル)。左は `GENC` で、声の山が − で右(高く)・+ で左(低く)へ動く。右は `TENC` で、線全体が上下し、右(高い音)ほど開きが大きい。

<img src="docs/mel-compare.webp" alt="GENC・TENC の値違いの平均スペクトル">

<br>

<a id="pitch-line"></a>

### 聞こえる音程が画面の線に出る

direct の句でも、ピアノロールの線は実際に鳴る音程です。元の PR では灰色の線が OpenUtau 側の音程のままで、聞こえる音と食い違っていました。

**どこで**: ピアノロールの白い線。線を見ながら PITD を描き足せる。

**画面**: 白い線が実際に鳴る音程。赤枠は自分で付けたビブラートで、direct のまま NEUTRINO の音程の上に足され、線にもそのまま出る。

<img src="docs/pitch-line.webp" alt="実際に鳴る音程の線">

<br>

<a id="teacher"></a>

### 句ごとに声と歌い方を選ぶ

1 つのトラックの中で、句(音符が隙間なくつながったまとまり)ごとに、歌う声と歌い方を別々に選べます。例: VOICEVOX のずんだもんの声で、NEUTRINO の KIRITAN の歌い方。

**どこで**: 句の音符を 1 つ選ぶ → 右の「音符のプロパティ」→「表情」。1 つの音符で選べば、その句の音符全部に入る。

| 表情 | 選ぶ物 | 例 |
|---|---|---|
| `voice (phrase)` | 歌う声 | VOICEVOX のずんだもん |
| `singing style (phrase)` | 歌い方 = 音程の線(VOICEVOX では音量も)を借りる NEUTRINO の歌手 | NEUTRINO の KIRITAN |

- 歌い方は、NEUTRINO 本体のサポートモデル(`-S`)と同じ働き。
- 歌い方を選ぶと、その句の `direct` も自動で on になる(off のままだと歌い方の線が使われない)。
- その上に、自分のビブラート・PITD も足せる。
- 選んだ句の上には「声 … ・ 歌い方 …」の青い帯が出て、効く範囲が分かる。

**画面**: VOICEVOX のずんだもんの声 × KIRITAN の歌い方にした句。右の赤枠が選ぶ所、上の赤枠の青い帯が効いている範囲。白い線が実際に鳴る音程。

<img src="docs/phrase-voice.webp" alt="句ごとに声と歌い方を選んだ画面">

<br>

<a id="style-f0"></a>

### 歌い方の効き具合を句ごとに整える

実際に鳴る音程の線を、句ごとに 3 つの数字で整えます。効くのは NEUTRINO の direct の句と、歌い方を付けた VOICEVOX の句。既定のままなら今までと同じ音です。

**どこで**: 句の音符を 1 つ選ぶ → 右の「音符のプロパティ」→「表情」の 3 つ。1 つの音符で入れれば、その句の音符全部に入る。

| 表情 | 何が変わる | 既定 |
|---|---|---|
| `tuning % (phrase)` | 自分で付けたビブラート・PITD を何割足すか | 100(そのまま) |
| `smooth Hz (phrase)` | 1 秒にこの回数より速い揺れを均す(小さいほど強い) | 0(切) |
| `tail limit c (phrase)` | 語尾の落ちを何セントで止めるか | 0(切) |

**画面**: 同じ句を、既定のまま(上)と 50 %・12 Hz・200 c(下)にした所。右の赤枠が 3 つの数字を入れる所。下では句の上に「調声 50% ・ 平滑 12 Hz ・ 語尾 200c」の帯が出て、語尾の落ち(赤枠)が止まり、ビブラートが小さくなる。

<img src="docs/singing-style-shape.webp" alt="既定と 50 %・12 Hz・200 c の画面">

<br>

**こうすると → こうなる**(同じ句を値だけ変えて書き出し、「い」の伸ばしを実測)

| 表情 | 値 | こうなる |
|---|---|---|
| `tuning %` | 100(既定) | 揺れ幅 74 c |
| `tuning %` | 50 | 揺れ幅 38 c |
| `tuning %` | 0 | 揺れ幅 18 c(NEUTRINO がもともと出す揺れだけ残る) |
| `smooth Hz` | 0(切)・24・12 | 揺れ幅 74 c のまま(ビブラートは 1 秒に 5〜6 回なので均されない) |
| `smooth Hz` | 6 | 揺れ幅 44 c。ビブラートも小さくなる |
| `tail limit c` | 0(切) | 語尾の落ち 198 c |
| `tail limit c` | 200 | 語尾の落ち 149 c |
| `tail limit c` | 100 | 語尾の落ち 105 c |

- `tail limit c` は、浅い落ちはほぼそのまま、深い落ちほどこの値へなめらかに寄せる。

**図**: 上の表の実測。「い」の音程で、青い帯が譜面の C5。左: `tuning %` を下げるほど波が小さい。中: 6 Hz(緑)だけ波が小さい。右: 終わりの落ちが浅く止まる。

<img src="docs/style-f0.webp" alt="tuning %・smooth Hz・tail limit c の値ごとに測った「い」の音程">

<br>

## ソース

素の OpenUtau に、上から順に重ねた物です。

| | 重ねた物 | 中身 |
|---|---|---|
| 1 | 本家 [OpenUtau](https://github.com/openutau/OpenUtau) | 固定版は 0.1.570.3(2 が取り込んだ版)、最新版は 0.1.577.11(本家 `master` の [08222cb7](https://github.com/openutau/OpenUtau/commit/08222cb7c48c4ab47faa34a6efc34e2c00898a1e)、2026-11-16)。VOICEVOX で歌う機能はここに元からある |
| 2 | NEUTRINO 対応 | rokujyushi さんの PR [openutau/OpenUtau#2136](https://github.com/openutau/OpenUtau/pull/2136)。[rokujyushi/OpenUtau](https://github.com/rokujyushi/OpenUtau/tree/neutrino) の `neutrino` ブランチ([203c44f5](https://github.com/rokujyushi/OpenUtau/commit/203c44f5d1374697abfa69626a2b52a19627184b)) |
| 3 | 画面なしの書き出し(CLI) | christianazinn さんの PR [openutau/OpenUtau#2162](https://github.com/openutau/OpenUtau/pull/2162) を、NEUTRINO 対応版で動くように直した物 |
| 4 | この版で足した機能 | 上の「[足した機能](#足した機能)」 |

### ブランチ

ビルドしたソースは、この repo のブランチにそのまま並べてあります(CI が組み立てる物と中身が同じ)。

| | ブランチ | 中身 |
|---|---|---|
| 固定版 | [`neutrino-cli-dist`](https://github.com/pika-02-03/OpenUtau-NEUTRINO/tree/neutrino-cli-dist) | 2 の `neutrino` に、下の表の「固定版」のコミットを足した物 |

```bash
git clone -b neutrino-cli-dist https://github.com/pika-02-03/OpenUtau-NEUTRINO.git
```

自分で組み立てる時は、2 の `neutrino`(最新版はそこへ本家の `master` をマージした物)に、下の表のコミットを cherry-pick します。当てる順番は [packaging/extra-commits.txt](https://github.com/pika-02-03/OpenUtau-NEUTRINO/blob/release-kit/packaging/extra-commits.txt)(固定版)・[extra-commits-latest.txt](https://github.com/pika-02-03/OpenUtau-NEUTRINO/blob/release-kit/packaging/extra-commits-latest.txt)(最新版)のとおりで、CI も同じ一覧を [apply-extra-commits.sh](https://github.com/pika-02-03/OpenUtau-NEUTRINO/blob/release-kit/packaging/apply-extra-commits.sh) で当てています。

### 足したコミット

| 中身 | 誰の物か | 固定版 | 最新版 | 本家 `master` 向け |
|---|---|---|---|---|
| v3 の声で声色・明るさを変える(mel 編集) | rokujyushi さん([`Editid-Mel-spectrogram`](https://github.com/rokujyushi/OpenUtau/tree/Editid-Mel-spectrogram) ブランチ) | [c5cb0f47](https://github.com/rokujyushi/OpenUtau/commit/c5cb0f47243a012d20c79d73b58d354b9149d7af) | [7b8ebd79](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/7b8ebd790b6c5a7f7a91c14c339eb70f136b4d25) |  |
| direct でも自分のビブラート・ピッチが効く | この repo | [7a637f20](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/7a637f201e12ad5840cef3371d6fe8fb8fb187e0) | [f6f6ae32](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/f6f6ae32d2e7655638e7817a247ba217676dd7a1) |  |
| 聞こえる音程が画面の線に出る | この repo | [7ee7cbc8](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/7ee7cbc8e951d3338f1fa45c88394b8cf8b32498) | [ca70f8be](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/ca70f8bedb679aba8f5994904ad2276b9ab7165a) |  |
| Mac で Shift+ホイールの横スクロール | この repo | [4e6c5f7c](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/4e6c5f7c3e890da4d003b5d8f39653b74ef7789a) | [502e607c](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/502e607cf137ce42fd6a7882581ba20e4a6fca9b) | [`openutau-fix/mac-shift-wheel`](https://github.com/pika-02-03/OpenUtau-NEUTRINO/tree/openutau-fix/mac-shift-wheel) [8ae718f2](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/8ae718f25761df64901baa24d631c58a61ee9937) |
| 画面を開かずに書き出す(CLI) | christianazinn さんの PR [openutau/OpenUtau#2162](https://github.com/openutau/OpenUtau/pull/2162)(コミットはこの repo に写してある) | [003f50ed](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/003f50ede862081ee40e86dbc43c53930eb74ef4) ほか 8 本 | [8c0789a5](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/8c0789a5f65dbf43b82039629d9e4c294adaba0b) ほか 8 本 |  |
| CLI を NEUTRINO 対応版で動かす直し | この repo | [bc287690](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/bc287690e45642c69ceaccc64dba139bdef9b9fa) | [72d4e4c5](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/72d4e4c59b260962c244e7dfff493e70737cfdaa) |  |
| 句ごとに声と歌い方を選ぶ | この repo | [7eea7f8b](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/7eea7f8b366ae440969d9224ab787ab1ed26fde4) [254c5d08](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/254c5d080e020d9379d6b38b262e0be2ffea8cdf) | [59140887](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/59140887d54937c14a8c97eec0546ad8a9bced65) [01656bd2](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/01656bd2fdf8e000789cefe8f555c28ab5525afd) |  |
| どの句をどの声・歌い方で歌うかが見える | この repo | [66fc0a89](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/66fc0a897258fe65c1d1a73503a1e888254a378c) | [aa61eb58](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/aa61eb58820393a82f6c7f379863cf4cc335faf9) |  |
| 歌い方の効き具合を句ごとに整える | この repo | [6728893e](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/6728893e8d7a3f2e1ae72be04f91022ba7dd072e) | [8f5116e5](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/8f5116e5478039b6162c09d8a990266038b468b8) |  |
| NEUTRINO v3 の声のトラックでは、2.x でだけ効く表情(engine type・engine mode・tone shift)を出さない | この repo | [93924e37](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/93924e37a7dc34468e8180e55371f8264ff87b2c) | [1212db67](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/1212db67e9633f1efd48e9db098e1b98fddc190d) |  |
| VOICEVOX の音を 44.1 kHz で受ける | この repo | [80260a2a](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/80260a2ae015fa55f9facd592c3826addac6c883) | [6f74e0e6](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/6f74e0e6f2272baf41458a16d0d1a067877fec2d) | [`openutau-fix/voicevox-44100`](https://github.com/pika-02-03/OpenUtau-NEUTRINO/tree/openutau-fix/voicevox-44100) [76f51a7f](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/76f51a7faed1642bce3b648ec270ee2638a0f35b) |
| 44.1 kHz でない音を sinc で変換する | この repo | [4aca8803](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/4aca88036dea1750f4d996df8545e78dea292468) | [edce1f9f](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/edce1f9fdc783d2de0583e4da5fcfa33c2f49783) | [`openutau-fix/sinc-resampling`](https://github.com/pika-02-03/OpenUtau-NEUTRINO/tree/openutau-fix/sinc-resampling) [c94ffe8a](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/c94ffe8ad1daca46048d878bf49bb5bf00c11ff7) |
| VOICEVOX でカタカナの歌詞も歌う | この repo | [0ce80d9a](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/0ce80d9ac3e437501b6bd3f21f46afc9fd8262f0) | [2b58fd53](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/2b58fd53c5bd0cdd920f853050071d6c84f7384d) | [`openutau-fix/voicevox-katakana-lyrics`](https://github.com/pika-02-03/OpenUtau-NEUTRINO/tree/openutau-fix/voicevox-katakana-lyrics) [e522d9f0](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/e522d9f09f476796efb00d0d582552dbcb1da546) |
| VOICEVOX で `あっ[a cl]`・`づ`・`ー` も歌う | この repo | [ec9d6c63](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/ec9d6c63ec6db7e19619ff401177f61d7197f72d) | [e457d7d4](https://github.com/pika-02-03/OpenUtau-NEUTRINO/commit/e457d7d4547153da24ebf49f80f058ebb45b9716) |  |

コミットが 3 本以上の物は先頭だけ載せています。全部の並びは上の extra-commits.txt・extra-commits-latest.txt にあります。

右の列は、「この repo」の直しのうち本家の OpenUtau にもそのまま使える物を、本家 `master`([f920e242](https://github.com/openutau/OpenUtau/commit/f920e2423113f9a936ec77eebf1f192e02a7ea6a))に 1 コミットずつ載せたブランチです(テスト付き)。本家の OpenUtau に cherry-pick すれば、そのまま使えます。

```bash
git fetch https://github.com/pika-02-03/OpenUtau-NEUTRINO.git openutau-fix/sinc-resampling
git cherry-pick FETCH_HEAD
```

## 注意

非公式・無保証です。

この repo で足したコード(README の[ソース](https://github.com/pika-02-03/OpenUtau-NEUTRINO#ソース)で「この repo」と書いた物)は、連絡なしにどう使っても構いません。フォーク・改変・再配布・取り込み、何でも自由で、こちらは関知しません。

本家 OpenUtau や、PR を出している方々のコードは、それぞれの条件に従ってください。OpenUtau は [MIT ライセンス](https://github.com/openutau/OpenUtau/blob/master/LICENSE.txt)、NEUTRINO は[公式の規約](https://studio-neutrino.com/downloads/manual/EULA_NEUTRINO.pdf)です。
