# RealmTodo

## 目標
- Realmが使えるようになる
- 役割や機能ごとにクラスを分けることができるようになる
- MVCについて理解する

## 作成するアプリ  
|タスク一覧|タスク追加|タスク編集|タスク削除|
|---|---|---|---|
|<img src="../img/RealmTodoList.png" width="300px">|<img src="../img/RealmTodoAdd.gif" width="300px">|<img src="../img/RealmTodoEdit.gif" width="300px">|<img src="../img/RealmTodoDelete.gif" width="300px">|

## 開発の流れ

1. TodoRepository.swiftにタスク新規追加処理を追加する
2. TodoService.swiftにTodoRepository.swiftのタスク新規追加処理を呼び出す処理を追加する
3. InputViewController.swiftにTodoService.swiftのタスク新規追加処理を呼び出す処理を追記する
4. ViewController.swiftの追加ボタン押下時に画面遷移を追加する

## 開発しよう
1. TodoRepository.swiftにタスク新規追加処理を追加する
	
	1. タスクを作成するcreateメソッドを追記する。

		```
		// Todoを新規作成する
		func create(todo: Todo) {
			let realm = try! Realm()
			try! realm.write {
				realm.add(todo)
			}
		}
		```

		追記後のTodoRepository.swift

		```
		import RealmSwift

		class TodoRepository {
			// Todoを新規作成する
			func create(todo: Todo) {
				let realm = try! Realm()
				try! realm.write {
					realm.add(todo)
				}
			}
		}
		```

	2. 最大IDを取得するメソッドを追記する。

		```
		func getMaxId() -> Int {
			let realm = try! Realm()
			let maxId = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1

			return maxId
		}
		```

		追記後のTodoRepository.swift

		```
		import RealmSwift

		class TodoRepository {
			// Todoを新規作成する
			func create(todo: Todo) {
				let realm = try! Realm()
				try! realm.write {
					realm.add(todo)
				}
			}

			// Todoの最大IDを取得する
			func getMaxId() -> Int {
				let realm = try! Realm()
				let maxId = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
				
				return maxId
			}
		}
		```

2. TodoService.swiftにTodoRepository.swiftのタスク新規追加処理を呼び出す処理を追加する

	1. 以下のメソッドを追加する

		```
		func create(title: String) {
			let todo = Todo()
			let maxId = repository.getMaxId()
			
			todo.id = maxId
			todo.title = title
			todo.date = Date()
			
			repository.create(todo: todo)
		}
		```

		追記後のTodoService.swift

		```
		import Foundation

		class TodoService {
			// Todoリポジトリ
			let repository = TodoRepository()

			// Todoを新規作成する
			func create(title: String) {
				let todo = Todo()
				let maxId = repository.getMaxId()
				todo.id = maxId
				todo.title = title
				todo.date = Date()

				repository.create(todo: todo)
			}
		}
		```

3. InputViewController.swiftにTodoService.swiftのタスク新規追加処理を呼び出す処理を追記する

	1. ```didClickButton```メソッドに以下の処理を追記する

		```
		let todoService = TodoService()
		if let title = textField.text {
			todoService.create(title: title)
		}
		```

		追記後の```didClickButton```メソッド

		```
		@IBAction func didClickButton(_ sender: UIButton) {
			let todoService = TodoService()

			if let title = textField.text {
				todoService.create(title: title)
			}
		}
		```
4. ViewController.swiftの追加ボタン押下時に画面遷移を追加する

	1. ```didClickAddButton```ボタンに以下の処理を追記する

		```
		performSegue(withIdentifier: "toInputVC", sender: nil)
		```

		追記後の```didClickAddButton```

		```
		@IBAction func didClickAddButton(_ sender: UIButton) {
			performSegue(withIdentifier: "toInputVC", sender: nil)
		}
		```