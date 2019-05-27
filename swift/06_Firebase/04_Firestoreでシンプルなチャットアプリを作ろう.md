# Firestoreでシンプルなチャットアプリを作ろう

## 目標
- Firestoreが使えるようになる

## 作成するアプリ

## 開発の流れ

## 開発しよう
1. プロジェクトを作成する

	1. プロジェクトを作成する  
	プロジェクト名：SimpleChatApp
	
	2. Firebaseプロジェクトを作成し、FirebaseをiOSプロジェクトに追加する

2. 各画面を作成する
	
	1. トップ画面を作成する
		
		1. NavigationControllerを追加する
			
			![SimpleChatApp](./img/SimpleChatApp01.gif)
			
		2. NavigationBarにテキストフィールドとボタンを追加する

			![SimpleChatApp](./img/SimpleChatApp02.gif)
			
		3. TableViewとTableViewCellを追加する  
		TableViewCellのidentifierに「cell」を設定する
		
			![SimpleChatApp](./img/SimpleChatApp03.gif)
	
	2. チャット画面を作成する
		
		1. ViewControllerを追加する
			
			![SimpleChatApp](./img/SimpleChatApp04.png)
			
		2. トップ画面とチャット画面に画面遷移を定義する  
		identifierに「toRoom」を設定する
			
			![SimpleChatApp](./img/SimpleChatApp05.gif)
			
		3. Viewを画面下に配置する

			![SimpleChatApp](./img/SimpleChatApp06.gif)
		
		4. 配置したView内にTextFieldとButtonを配置する  
		（配置後、幅や背景色など好みに設定してください）
		
			![SimpleChatApp](./img/SimpleChatApp07.gif)
			
			<img src="./img/SimpleChatApp08.png" width="300px">

3. 各画面のViewControllerを準備する
	
	1. RoomViewController.swiftを作成する	

		![SimpleChatApp](./img/SimpleChatApp08.gif)

	2. Controllersグループを作成し、```ViewController.swift```と```RoomViewController.swift```をグループへ移動する

		![SimpleChatApp](./img/SimpleChatApp09.gif)