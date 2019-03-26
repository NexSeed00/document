# UITabBarController

## 目標
- UITabBarControllerが使えるようになる

## 開発の流れ

1. 画面の部品を配置する
	- ViewControllerの設置
	- Labelの設置
2. UITabBarControllerの設置

## 部品の説明

|部品名|概要|
|---|---|
| UITabBarController |タブによるページの切り替えが実装できる|

## 開発しよう

1. プロジェクトを作成する  
	[01_はじめてのアプリ開発](../s01_はじめてのアプリ開発.md)と同じように新規プロジェクトを作成する。  
	アプリ名：TabBarProject
	
2. 画面の部品を配置する
	1. ViewControllerを2つ配置する
		![Swiftロゴ](./img/place_two_viewcontroller.gif)

	2. 各画面にLabelを配置する
		![Swiftロゴ](./img/place_three_label.gif)

3. UITabBarControllerの設置
	1. 最初の画面を選択し、上のメニューから「Editor」→「Embed in」→ 「Tab Bar Controller」を選択する

		![Swiftロゴ](./img/add_tabbar.gif)

	2. 他の画面をタブメニューに追加する。
		TabBarControllerを選択し、Ctrlキーを押しながら、ViewControllerまでドラッグする。 
		接続時に表示されたウィンドウで、「view controllers」を選択する

		![Swiftロゴ](./img/add_vc_to_tabbar.gif)
	
5. 実行してみる。
	以下のように実行されればOKです。  

	<img src="./img/TabBarProject.gif" width="300px">

6. TabBarにアイコンを設定してみる。
	アイコンを設定したいコントローラー内のタブを選択し、ユーティリティエリアの属性インスペクタを選択する。  
	System Itemから任意のアイコンを選択する。

	![Swiftロゴ](./img/set_tabbar_icon.gif)
	
7. アイコンを設定して実行してみる。  

	<img src="./img/TabBarProject_2.gif" width="300px">