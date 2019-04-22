# LocalNotification

## 目標
- ローカル通知が使えるようになる

## 作成するアプリ  
<img src="./img/TextFieldViewAndButton.gif" width="300px">

## 開発の流れ

1. 画面の部品を配置する
	- TextFieldの設置
	- DatePickerの設置
	- Buttonの設置
2. 配置した画面の部品をプログラムで扱えるよう設定する
3. ユーザーに通知を許可するか確認するアラートを登録する
4. ボタンが押されたときのローカル通知の登録処理書く

## 部品の説明

|部品名|概要|
|---|---|
| TextField |通知のタイトル用|
| TextField |通知の内容用|
| DatePicker |通知時刻の設定用|
| Button |通知を登録する|

## 開発しよう

1. プロジェクトを作成する  
	[01_はじめてのアプリ開発](./01_はじめてのアプリ開発.md)と同じように新規プロジェクトを作成する。  
	アプリ名：LocalNotification
	
2. 画面の部品を配置する
	1. TextField, TextView, Button, Labelを以下のように配置する。  
		<img src="./img/set_item_notifi.png" width="300px">

3. 配置した画面の部品をプログラムで扱えるよう設定する
	1. 配置したTextField, DatePicker, Button, をViewController.swiftに接続する。

		|部品|接続時のName|
		|---|---|
		|UITextField（タイトル用）|textFieldForTitle|
		|UITextView（内容用）|textViewForContent|
		|DatePicker|datePicker|
		|UIButton|didClickButton|

		![Swiftロゴ](./img/connect_item_noti.png)

3. ユーザーに通知を許可するか確認するアラートを登録する
	1. ```AppDelegate.swift```に以下のimport文を追記する

		```
		import UserNotifications
		```

		追記後の```AppDelegate.swift```

		```
		import UIKit
		import UserNotifications

		@UIApplicationMain
		class AppDelegate: UIResponder, UIApplicationDelegate {
		```

	2. ```UNUserNotificationCenterDelegate```を```AppDelegate.swift```に追記する

		追記後の```AppDelegate.swift```

		```
		@UIApplicationMain
		class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
		```

	3. ```AppDelegate.swift```の```application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool```メソッドに以下の処理を追記する

		```
		if #available(iOS 10.0, *) {
				// iOS 10
				let center = UNUserNotificationCenter.current()
				center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
						if error != nil {
								return
						}
						
						if granted {
								print("通知許可")
								
								let center = UNUserNotificationCenter.current()
								center.delegate = self
								
						} else {
								print("通知拒否")
						}
				})
				
		} else {
				// iOS 9以下
				let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
				UIApplication.shared.registerUserNotificationSettings(settings)
		}
		```

		追記後の```application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool```メソッド

		```
		func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
			// Override point for customization after application launch.
			if #available(iOS 10.0, *) {
					// iOS 10
					let center = UNUserNotificationCenter.current()
					center.requestAuthorization(options: [.badge, .sound, .alert], completionHandler: { (granted, error) in
							if error != nil {
									return
							}
							
							if granted {
									print("通知許可")
									
									let center = UNUserNotificationCenter.current()
									center.delegate = self
									
							} else {
									print("通知拒否")
							}
					})
					
			} else {
					// iOS 9以下
					let settings = UIUserNotificationSettings(types: [.badge, .sound, .alert], categories: nil)
					UIApplication.shared.registerUserNotificationSettings(settings)
			}
			return true
    }
		```

		> 上記の処理を追加することによって、アプリ初回起動時に通知を許可するかの確認アラートが表示されます。  
		> <img src="./img/noti_alert.PNG" width="300px">

4. ボタンが押されたときのローカル通知の登録処理書く