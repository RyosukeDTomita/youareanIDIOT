# bashでブラウザクラッシャーYou are an idiotを再現する。
## Environment
- Ubuntu20.04
おそらく、他のOSでも動きますが動作未確認です。

## Content
- uareidot.bash
- splitwindow.bash
- youareidiot.mp3: youareidiotの音声ファイル
- record: bashファイル間の情報伝達用のファイル

## 実行イメージ
![実行イメージ](https://github.com/RyosukeDTomita/youareidiot/blob/master/sample/sample.gif)

## Required
- sox (mp3用のライブラリが必要)
- tmux
これらの必要なソフトウェアは、uareitiotwithtmux.bashを実行時に存在しなければ自動でインストールされます。
うまく実行できない場合は以下のようにインストールしてください。

```shell
sudo apt install tmux
sudo apt install sox
sudo apt install libsox-fmt-mp3
```
## How to use

```shell
sudo ./uareidiot.bash # 初回実行時
./uareidiot.bash      #2回目以降
```
- trapコマンドでCtrl - Cを押すたびに☺が増える。そのため、プロセスからkillする必要がある。
- tputで白黒に点滅する。
- soxを使って「You are an idiot♪」が流れる。

## How to stop
trapでCtrl-cシグナルをトラップしているのでkillするにはプロセスからkillする必要がある。

```shell
# 止め方
./killswitch.bash
```
