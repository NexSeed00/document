import UIKit
import RealmSwift

class InputViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    var todo:Todo? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let t = todo {
            textField.text = t.title
            button.setTitle("更新", for: .normal)
        } else {
            button.setTitle("追加", for: .normal)
        }
    }
    
    @IBAction func didClickBtn(_ sender: Any) {
        // テキストフィールドに入力があるか確認
        if let title = textField.text {
            if title == "" {
                return
            }
            // Realmに接続
            let realm = try! Realm()
            if let t = todo {
                try! realm.write {
                    t.title = title
                }
            } else {
                // TODOの作成
                todo = Todo()
                let id = (realm.objects(Todo.self).max(ofProperty: "id") as Int? ?? 0) + 1
                todo?.id = id
                todo?.title = title
                todo?.date = Date()
                // Realmに書き込み
                try! realm.write {
                    realm.add(todo!)
                }
            }
            // 履歴から前の画面に遷移
            navigationController?.popViewController(animated: true)
        }
    }
}
