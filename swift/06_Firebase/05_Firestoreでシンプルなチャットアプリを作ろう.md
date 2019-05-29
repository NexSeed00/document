# Firestoreでシンプルなチャットアプリを作ろう（ルーム画面）

## 目標
- Firestoreが使えるようになる

## 作成するアプリ

## 開発の流れ

## 開発しよう
1. 全チャットルームを保持する配列を作成する

	1. 以下の変数を```ViewController.swift```に追加する

		```swift
		var rooms: [Room] = []
		```

		追加後の```ViewController.swift```

		```swift
		class ViewController: UIViewController {

    	@IBOutlet weak var roomNameTextField: UITextField!
    
    	@IBOutlet weak var tableView: UITableView!
    
    	var rooms: [Room] = []
		```