# UIAlert

## 目標
- UIAlertが使えるようになる

## 開発の流れ

1. 画面の部品を配置する
	- Buttonの設置
2. 配置した画面の部品をプログラムで扱えるよう設定する
3. UIAlertの設定を書く

## 部品の説明

|部品名|概要|
|---|---|
| UIAlert |アラート表示ができる|

## 開発しよう

1. プロジェクトを作成する  
	[01_はじめてのアプリ開発](../s01_はじめてのアプリ開発.md)と同じように新規プロジェクトを作成する。  
	アプリ名：AlertProject
	
2. 画面の部品を配置する
	1. UIAlertを配置する
	![Swiftロゴ](./img/place_alert_button.gif)

3. 配置した画面の部品をプログラムで扱えるよう設定する
	1. 画面と対になるプログラムファイルを開く。  
		プログラムファイルを開きたい画面を選択し、右上の∞に似たアイコンをクリックする。  
		ViewController.swiftが開かれれば成功です。

	2. ButtonをViewController.swiftに接続する。  
	接続のためのウィンドウが表示されたら、Connection欄で「Action」を選択し、Name欄に「didClickButton」、Type欄に「UIButton」と入力し、「Connect」を選択。

	![Swiftロゴ](./img/connect_button.gif)

4. didClickButtonメソッド内にUIAlertの設定を書く
	1. Alertの画面を作成する。

		```
		let alert = UIAlertController(title: "タイトル", message: "選択してください", preferredStyle: .alert)
		```

		![Swiftロゴ](./img/alert_logic_1.gif)

	2. 作成したAlert画面を表示する。

		```
		present(alert, animated: true, completion: nil)
		```

		![Swiftロゴ](./img/alert_logic_2.gif)

	3. 実行してみる。  
		以下のように実行されればOKです。  
		<img src="./img/AlertProject_1.gif" width="300px">
	