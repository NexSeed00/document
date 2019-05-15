# MessageKit  

## 目標
- MessageKitライブラリが使えるようになる

## 使用するライブラリ
<a href="https://github.com/MessageKit/MessageKit">MessageKit</a>

## 作成するアプリ
<img src="./img/KolodaProject.gif" target="_blank" width="300px">

## 開発の流れ
1. プロジェクトを作成する
2. 画面の部品を配置する
3. 画像を用意する
4. ViewControllerにDelegateとDataSourceを追記する
5. Kolodaの設定を追記する

## 開発しよう
1. プロジェクトを作成する

	1. プロジェクトを作成する  
	アプリ名：MessageKitProject
	
	2. CocoaPodsでMessageKitをインストールする
	
		```
		pod 'MessageKit'
		```

2. 画面の部品を配置する

	1. 以下のように画面のCustomClassを```MessagesViewController```に変更する  
		![Swiftロゴ](./img/MessageKit01.png)

	2. プロジェクトを実行してみる
		<img src="./img/MessageKit02.png" width="300px">

3. 必要なグループとファイルを作成する

  1. 「Controllers」というグループを作成する。また作成したグループに```ViewController.swift```を移動する

    ![Swiftロゴ](./img/MessageKit03.gif)

  2. 「ValueObjects」というグループを作成する

    ![Swiftロゴ](./img/MessageKit04.png)