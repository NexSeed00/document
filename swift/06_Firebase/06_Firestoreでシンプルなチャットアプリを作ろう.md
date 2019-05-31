# Firestoreでシンプルなチャットアプリを作ろう（チャット画面）

## 目標
- Firestoreが使えるようになる

## 作成するアプリ

## 開発の流れ

## 開発しよう
1. チャットルームのドキュメントIDを保持する変数を用意する

	1. 以下の変数を`RoomViewController.swift`を追加する

		```
		var documentId = ""
		```

		追記後の`RoomViewController.swift`

		```swift
		class RoomViewController: UIViewController {
		
			@IBOutlet weak var messageTextField: UITextField!
			
			@IBOutlet weak var tableView: UITableView!
			
			var documentId = ""
		```

2. チャットルーム画面でルームが選択された時、選択されたチャットルームのドキュメントIDを、  
先程作成した変数`documentId`に設定するよう修正する。

	1. `ViewController.swift` に、チャットルームが選択されたときの処理を追記する

		以下のメソッドを`extension ViewController`に追記する

		```swift
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			<#code#>
		}
		```

	2. 上記で追記した`didSelectRowAt`メソッド内で、チャットルームへ画面遷移する処理を追記する。

		以下の処理を追記する

		```swift
		performSegue(withIdentifier: "toRoom", sender: nil)
		```

		追記後の`didSelectRowAt`メソッド

		```swift
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			performSegue(withIdentifier: "toRoom", sender: nil)
		}
		```