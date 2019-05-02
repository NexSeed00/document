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

1. TableViewCellに右矢印を追加する
2. InputViewController.swiftに編集対象のTodoを保持する変数を追記する
3. ```ViewController.swift```セルクリック時の処理を追記する
4. 入力画面表示時に、新規追加か編集か判断し、画面の表示方法を切り替える
5. TodoRepository, TodoService,InputViewControllerにそれぞれ更新の処理を追記する。

## 開発しよう

1. TableViewCellに右矢印を追加する

	1. ViewController.swiftの```cellForRowAt```メソッドに以下の処理を追記する
		
		```
		cell.accessoryType = .disclosureIndicator
		```

		追記後の```cellForRowAt```メソッド

		```
		func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
			let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

			let todo = todos[indexPath.row]

			// セルのタイトルにTodoのタイトルを設定
			cell.textLabel?.text = todo.title

			cell.accessoryType = .disclosureIndicator

			return cell
		}
		```
2. InputViewController.swiftに編集対象のTodoを保持する変数を追記する

	1. 以下のコードを追記する

		```
		var todo: Todo? = nil
		```

		追記後の```InputViewController.swift```

		```
		class InputViewController: UIViewController {

			@IBOutlet weak var textField: UITextField!

			var todo: Todo? = nil
		```

3. ```ViewController.swift```セルクリック時の処理を追記する

	1. 以下のメソッドを追記する

		```
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			<#code#>
		}
		```

	2. 追加した```didSelectRowAt```メソッドに以下の処理を追記する

		```
		let todo = todos[indexPath.row]
		performSegue(withIdentifier: "toInputVC", sender: todo)
		```

		追記後の```didSelectRowAt```メソッド

		```
		func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
			let todo = todos[indexPath.row]
			performSegue(withIdentifier: "toInputVC", sender: todo)
		}
		```

	3. 以下のメソッドを追記する

		```
		override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			<#code#>
		}
		```

	4. 追加した```prepare```メソッドに以下の処理を追記する

		```
		if segue.identifier == "toInputVC" {
			let inputVC = segue.destination as! InputViewController
			inputVC.todo = sender as? Todo
		}
		```

		追記後の```prepare```メソッド

		```
		override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
			if segue.identifier == "toInputVC" {
				let inputVC = segue.destination as! InputViewController
				inputVC.todo = sender as? Todo
			}
		}
		```

4. 入力画面表示時に、新規追加か編集か判断し、画面の表示方法を切り替える

	1. InputViewController.swiftに以下のメソッドを追記する

		```
		override func viewWillAppear(_ animated: Bool) {
			<#code#>
		}
		```

	2. 追加した```viewWillAppear```メソッドに以下の処理を追記する

		```
		if todo != nil {
			textField.text = todo?.title
			button.setTitle("更新", for: .normal)
		} else {
			button.setTitle("追加", for: .normal)
		}
		```

		追記後の```viewWillAppear```メソッド

		```
		override func viewWillAppear(_ animated: Bool) {
			if todo != nil {
				textField.text = todo?.title
				button.setTitle("更新", for: .normal)
			} else {
				button.setTitle("追加", for: .normal)
			}
		}
		```

5. TodoRepository, TodoService,InputViewControllerにそれぞれ更新の処理を追記する。

	1. TodoRepositoryに以下の2つメソッドを追記する。

		```
		func update(newTodo: Todo) {
			let realm = try! Realm()
			let todo = findById(id: newTodo.id)
			try! realm.write {
				todo?.title = newTodo.title
				todo?.date = newTodo.date
			}
		}
		```

		```
		func findById(id: Int) -> Todo! {
			let realm = try! Realm()
			let todo = realm.objects(Todo.self).filter("id = \(id)").first
			return todo
		}
		```

	2. TodoServiceに以下のメソッドを追記する。

		```
		func update(id: Int, newTitle: String) {
			let todo = Todo()
			todo.id = id
			todo.title = newTitle

			repository.update(newTodo: todo)
		}
		```

	3. InputViewController.swiftの```didClickButton```メソッドを以下のように修正する。

		```
		@IBAction func didClickButton(_ sender: UIButton) {
			let todoService = TodoService()

			if let title = textField.text {
				if todo == nil {
					todoService.create(title: title)
				} else {
					todoService.update(id: todo!.id, newTitle: title)
				}

				navigationController?.popViewController(animated: true)
			} else {
				print("Todoが入力されていません")
			}
		}
		```