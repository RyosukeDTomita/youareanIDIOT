# bashでブラウザクラッシャーYou are idiotを再現する。
## Environment
- Ubuntu20.04
おそらく、他のOSでも動きますが動作未確認です。

## Content
- uareidotwithtmux.bash
- youareidiot.bash
- music/youareidiot.mp3: youareidiotの音声ファイル
- record: bashファイル間の情報伝達用のファイル

## Required
- sox (mp3用のライブラリが必要)
- tmux
これらの必要なソフトウェアは、uareitiotwithtmux.bashを実行時に存在しなければ自動でインストールされます。
うまく実行できない場合は以下のようにインストールしてください。

```
sudo apt install tmux
sudo apt install sox
sudo apt install libsox-fmt-mp3
```
## How to use

```
sudo ./uareidiotwithtmux.bash # 初回実行時
./uareidiotwithtmux.bash      #2回目以降
```