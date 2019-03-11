## ユーザーと投稿の紐付け / エラーハンドリング

### 投稿機能 
DiaryControllerを編集
```
use Illuminate\Support\Facades\Auth;

public function store(CreateDiary $request)
{
    $diary = new Diary(); //Diaryモデルをインスタンス化

    $diary->title = $request->title; //画面で入力されたタイトルを代入
    $diary->body = $request->body; //画面で入力された本文を代入
    $diary->user_id = Auth::user()->id; //追加 ログインしてるユーザーのidを保存
    $diary->save(); //DBに保存

    return redirect()->route('diary.index'); //一覧ページにリダイレクト
}
```

### 存在しないページへのアクセス
#### ルートモデルバインディング
web.phpのルートの定義で、`{diary}`の部分と、
対応するControllerのメソッドの仮引数名`($diary)`が同じで、
引数が型指定`Diary`となっていた場合、
自動的に該当するモデルのインスタンスを作成します。
インスタンスを作成できない場合(該当のidがない場合)は
404を返してくれます。
また、モデルのインスタンスが作成されるため、
各メソッドに書いていた、
`$diary = Diary::find($id)`が不要になります。


#### 変更する内容
web.phpを`{id}` を全て `{diary}`に変更
```
- {id}
+ {diary}
```

DiaryControllerのメソッドで、引数が`(int $id)`の箇所を全て`(Diary $diary)`に変更
```
- (int $id)
+ (Diary $diary)
```

DiaryController全体
```
class DiaryController extends Controller
{
    public function index()
    {

        $diaries = Diary::all();

        return view('diaries.index',[
            'diaries' => $diaries,
        ]);
    }

    public function create()
    {
        return view('diaries.create');
    }

    public function store(CreateDiary $request)
    {
        $diary = new Diary(); //Diaryモデルをインスタンス化

        $diary->title = $request->title; //画面で入力されたタイトルを代入
        $diary->body = $request->body; //画面で入力された本文を代入
        $diary->user_id = Auth::user()->id;
        $diary->save(); //DBに保存

        return redirect()->route('diary.index'); //一覧ページにリダイレクト
    }

    public function edit(Diary $diary)
    {
        return view('diaries.edit', [
            'diary' => $diary,
        ]);
    }

    public function update(Diary $diary, CreateDiary $request)
    {
        $diary->title = $request->title; //画面で入力されたタイトルを代入
        $diary->body = $request->body; //画面で入力された本文を代入
        $diary->save(); //DBに保存

        return redirect()->route('diary.index'); //一覧ページにリダイレクト
    }

    public function destroy(Diary $diary)
    {
        $diary->delete();

        return redirect()->route('diary.index');
    }
}
```


### 存在するが自分のコンテンツではないページの処理(認可)
- 編集、削除ボタンを非表示にする
```
@if (Auth::check() && Auth::user()->id === $diary->user_id)
    <a class="btn btn-success" href="{{ route('diary.edit', ['id' => $diary->id]) }}">編集</a>
    <form action="{{ route('diary.destroy', ['id' => $diary->id]) }}" method="post" class="d-inline">
        @csrf
        @method('delete')
        <button class="btn btn-danger">削除</button>
    </form>
@endif
```
if文の意味はログインしていて、かつ、ログインユーザーのidと投稿のidが同じ場合は。
ということになります。


これで編集、削除ボタンは表示されなくなりましたが、
URLを直接入力すると表示されてしまいます。

- URLを直接入力しても表示できないようにする
以下の内容を`edit`, `update`, `destroy`メソッドに追記
```
if (Auth::user()->id !== $diary->user_id) {
    abort(403);
}       
```
※ポリシークラスはややこしいので使わない。
※セキュリティ的に404エラーでもいいけど、勉強なので403。

### おまけ(授業では実施しない)
#### エラー画面の作成
views/errors/ディレクトリを作成し、
各ステータスコードのファイルを作成するのみ
例:404 -> `404.blade.php`

## まとめ
以上でLaravel終わりです