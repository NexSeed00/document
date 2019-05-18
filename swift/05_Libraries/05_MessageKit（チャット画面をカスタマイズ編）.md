# MessageKit

## 目標
- MessageKitライブラリが使えるようになる
- MessageKitでいろいろなカスタマイズができるようになる

## 使用するライブラリ
<a href="https://github.com/MessageKit/MessageKit" target="_blank">MessageKit</a>

## 前提条件
<a href="./04_MessageKit.md">こちらのチャットアプリが完成済みであること</a>

## カスタマイズ一覧
1. メッセージの文字の色を変える
2. メッセージの背景色を変える

### 1. メッセージの文字の色を変える

1. ``` extension ViewController: MessagesDisplayDelegate ``` 内に以下のメソッドを追記する。
	```
	func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {

	}
	```

2. 先程追加したメソッドを以下のように修正する
	```
	func textColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
		if isFromCurrentSender(message: message) {
			// 自分が送信したメッセージの場合
			return .black
		} else {
			// 自分以外が送信したメッセージの場合
			return .blue
		}     
	}
  ```

### 2. メッセージの背景色を変える

1. ``` extension ViewController: MessagesDisplayDelegate ``` 内に以下のメソッドを追記する。

	```
	func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
		<#code#>
	}
	```

2. 先程追加したメソッドを以下のように修正する

	```
	func backgroundColor(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> UIColor {
		if isFromCurrentSender(message: message) {
			// 自分が送信したメッセージの場合
			return .white
		} else {
			// 自分以外が送信したメッセージの場合
			return .orange
		}    
  }
	```