## メニュー

- 左
  - ディレクトリ(フォルダ)
  - 検索
  - Git(バージョン管理ツール)
  - デバッグ
  - プラグイン
- 右
  - 編集中のファイル
- 下
  - ターミナル
    - Mac -> ctrl + `
    - Windows -> ctrl + @
- 上
  - 各種メニュー

## ショートカットキー

cmd + ] -> インデント追加
cmd + [ -> インデント削除
cmd + f -> ファイル内検索
cmd + shift + f -> プロジェクト内検索
cmd + p -> ファイル名検索
cmd + B -> 左パネルの表示 / 非表示切り替え
option + 矢印 -> 行の移動
option + shift + 矢印(上 or 下) -> 行のコピー
cmd + shift + k -> 行の削除
ctl + 数字 -> タブの切り替え
cmd + \ -> 画面分割
cmd + w -> ウィンドウを閉じる
cmd + 数字 -> 画面移動
cmd + k, t -> テーマ変更
cmd + d -> 次のマッチしてる文字を選択
cmd + shift + l -> マッチしてる文字を全て選択
cmd + 矢印 -> 1 番端に移動
cmd + / -> コメントイン /コメントアウト
ctl + g -> 指定の行に移動
cmd + shift + E -> ディレクトリ
cmd + shift + t -> 直前に閉じたファイルを開く
cmd + j or ctl + ` -> ターミナルの表示 / 非表示
option + 矢印(左右) -> 区切りの良いところまで移動
cmd + k -> cmd + f -> インデントを揃える

## プラグイン

### 見た目

- Material Theme
- Ayu
- Dracula Official
- Material Icon Theme
  - ※ Icon が変わらない場合
    - cmd + shift + p
      - File Icon Theme から変更する

### 機能追加

- Bracket Pair Colorizer
- Auto Rename Tag
- open in browser
- GitLens
- php Intelephense

### 使用するフォントの変更

- ricty diminished というフォントがみやすい

#### 変更手順

1. PC に ricty diminished をインストール
2. ricty diminished を VSCode に設定

##### PC に ricty diminished をインストール

- windows の手順
  - https://nelog.jp/how-to-use-ricty-diminished-font
- mac の手順
  - https://jinnaitakumi.com/ricty_diminished/

##### ricty diminished を VSCode に設定

- cmd + ,で設定を開く
- search settings で `font` と検索
- Font Family の欄を `Ricty Diminished` に変更
- フォントが変わっていることを確認する

### その他

#### デフォルトのインデントサイズ変更

- cmd + ,で設定を開く
- search settings で `tab size` と検索
- tab size の欄の数字を変更

#### フォントサイズの変更

- cmd + ,で設定を開く
- search settings で `font` と検索
- tab size の欄の数字を変更

#### 不可視文字の表示
- VS Codeの設定
- 不可視文字の表示
- cmd + , -> editor.renderControlCharactersで検索 -> editor: renderControlCharactersにチェック