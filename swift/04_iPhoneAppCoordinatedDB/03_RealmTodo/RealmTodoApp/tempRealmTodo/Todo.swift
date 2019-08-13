import RealmSwift

class Todo: Object {
    @objc dynamic var id:Int = Int()
    @objc dynamic var title:String = String()
    @objc dynamic var date:Date = Date()
}
