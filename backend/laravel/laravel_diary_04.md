## 新規投稿機能の作成
### 今回学ぶこと
投稿画面の作成と、投稿の保存処理をします
まず最初に投稿画面を作成し、そのあと保存処理をします。

### Routeの設定
```
Route::get('/folders/create', 'FolderController@showCreateForm')->name('folders.create');
Route::post('/folders/create', 'FolderController@create');
```

### Controllerの編集(投稿画面)
DiaryController.phpに以下を追加
```
public function create()
{
    return view('diaries.create');
}
```

### Viewの作成(投稿画面)
diaries/create.blade.phpを作成
```
Hello create
```
http://localhost:8000/diary/createにブラウザからアクセスして
画面が正しく表示されることを確認

diaries/create.blade.phpを編集
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/app.css">
    <title>新規投稿画面</title>
</head>
<body>
    <section class="container m-5">
        <div class="row justify-content-center">
            <div class="col-8">
                <form action="{{ route('diary.create') }}" method="post">
                    @csrf
                    <div class="form-group">
                        <label for="title">タイトル</label>
                        <input type="text" class="form-control" name="title" id="title" />
                    </div>
                    <div class="form-group">
                        <label for="title">本文</label>
                        <textarea class="form-control" name="body" id="body"></textarea>
                    </div>
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">投稿</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>
```

- formのaction説明
- csrf対策説明

### Controllerの編集(保存処理)
今の状態で送信ボタンを押すとエラー

DiaryController.phpを編集する
```
public function store()
{
    dd('ここに保存処理');
}
```
画面が表示されたことを確認する

DiaryController.phpを編集する
```
public function store(Request $request)
{
    $diary = new Diary(); //Diaryモデルをインスタンス化

    $diary->title = $request->title; //画面で入力されたタイトルを代入
    $diary->body = $request->body; //画面で入力された本文を代入
    $diary->save(); //DBに保存

    return redirect()->route('diary.index'); //一覧ページにリダイレクト
}
```
一覧画面が表示され、入力した内容が表示されている

- 入力された値の受け渡しに関して説明

### 一覧画面にリンクを追加
一覧画面から投稿画面に移動できるようにリンクを追加します
index.blade.phpのbodyタグのすぐ下に以下を追記
```
<a href="{{ route('diary.create') }}" class="btn btn-primary btn-block">
    新規投稿
</a>
```
一覧画面から投稿画面に移動できることを確認

### バリデーション
- 何も保存していない状態で投稿処理
    - 投稿処理
      - エラー
        - DBでnullを許容してないのに、nullのため

#### バリデーションの準備
`php artisan make:request CreateDiary`

CreateDiaryを編集
```
class CreateDiary extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'title' => 'required|max:30', 
            'body' => 'required',
        ];
    }

    public function attributes()
    {
        return [
            'title' => 'タイトル',
            'body' => '本文',
        ];
    }
}
```

#### Controllerの編集
DiaryControllerを編集
```
use App\Http\Requests\CreateDiary;

public function store(CreateDiary $request)
{

}
```
文字を何も入力しないでボタンを押すと元の画面にもどります。
ただ、エラーなど何も表示されないのでユーザーは
何が起きたかわかりません。

#### viewにエラーメッセージ表示
create.blade.phpのformタグの上に以下追加
```
  @if($errors->any())
      <ul>
          @foreach($errors->all() as $message)
          <li class="alert alert-danger">{{ $message }}</li>
          @endforeach
      </ul>
  @endif
```
$errorsという変数にエラーの内容が入っている

#### 入力内容の保持
エラーで元の画面に戻った後に、
一から入力するのは面倒です。
そのため、入力内容を保持できるようにします。
create.blade.phpの入力欄を以下のように編集
```
<input type="text" class="form-control" name="title" id="title" value="{{ old('title') }}">

<textarea class="form-control" name="body" id="body">{{ old('body') }}</textarea>

```

### おまけ(授業では実施しない)
#### エラーメッセージの日本語化
- `/resources/lang/jp`ディレクトリを作成
- `/resources/lang/en/validation.php`を`/resources/lang/jp/`にコピー
- 必要な箇所を日本語に編集

    validation.php
    ```
    'required' => ':attribute は必須です。',
    'string' => ':attribute は :max 文字以内にしてください。', //81行目
    ```

    - config/app.phpのlocaleをjpに変更
    ```
    'locale' => 'jp',
    ```

    - CreateDiaryに以下追加
    ```
    public function attributes()
    {
        return [
            'title' => 'タイトル',
            'body' => '本文',
        ];
    }
    ```
    エラー内容が日本語になってることを確認
