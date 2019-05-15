## 新規投稿機能の作成
### 学ぶこと
このカリキュラムでは、投稿画面の作成と保存処理の作成を通して以下のことを学びます。  
1. ブラウザからURLを入力して、画面が表示されるまでの流(復習)
2. フォームからデータを送信する方法
3. データを保存する方法
4. バリデーションの方法

### ルートの設定
一覧の作成同様まずはルートの設定をします。  
ルートでは、**①どのURL(メソッドも含む)の時に**、**②どのコントローラーの**、**③どのメソッドを使用するか**  
を決めます。  


投稿画面と、保存処理のルートを追記してください。
```php
// routes/web.php
Route::get('/', 'DiaryController@index')->name('diary.index');

Route::get('diary/create', 'DiaryController@create')->name('diary.create'); // 投稿画面
Route::post('diary/create', 'DiaryController@store')->name('diary.create'); // 保存処理
```

### コントローラーの編集(投稿画面)
createメソッドを追加します。

```php
// app/Http/Controllers/DiaryController

    public function index()
    {
        //省略
    }

public function create()
{
    // views/diaries/create.blade.phpを表示する
    return view('diaries.create');
}
```

### ビューの作成(投稿画面)
投稿画面にはDBのデータを表示する必要がないため、  
モデルでの処理はありません。 

投稿画面用のビューを作成します。
`resources/views/diaries/`ディレクトリに`create.blade.php`を作成して以下の内容をコピーしてください
。  

```php
// resources/views/diaries/create.blade.php

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
                <form action="{{ route('diary.create') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="title">タイトル</label>
                        <input type="text" class="form-control" name="title" id="title" />
                    </div>
                    <div class="form-group">
                        <label for="body">本文</label>
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

以下のURLにアクセスして画面が正しく表示されることを確認しましょう。  
http://localhost:8000/diary/create

ここまでで、
URLを入力して画面が表示されるまでの流れは、    
1. web.phpで使用するコントローラーとメソッドの確認
2. 1で指定されたコントローラーのメソッドを実行
3. 2で指定されたビューを表示する
となります。


画面は正しく表示されましたが、  
今回のビューには2箇所新しい書き方
1. `<form action="{{ route('diary.create') }}" method="POST">`
2. `@csrf`

#### フォームのactionに関して
まずはフォームのアクションに関して説明します。  
フォームのアクションには、遷移先のページのURLを入力することは既に  
既に認識されているかと思います。  

`action="{{ route('diary.create') }}" `も遷移先を指定してます。  
`route('diary.create')`と書くことこで、ルートに指定した`name`のURLに変換されます。  

```php
// routes/web.php
Route::get('/', 'DiaryController@index')->name('diary.index');

Route::get('diary/create', 'DiaryController@create')->name('diary.create'); // 投稿画面
Route::post('diary/create', 'DiaryController@store')->name('diary.create'); // 保存処理
```

上記が現在のルートです。  
それぞれ`>name('xxx.yyy')`となってますが、  
Laravelでは`<form>`や`<a>`で遷移先を指定するときに、`route('xxx.yyy')`とすることで、  
リンクが対応したURLになります。  

今回の場合は、`{{ route('diary.create') }}`なので、URLは`diary/create`となります。  
また、formに指定されているメソッドは`POST`のため、  
投稿ボタンを押した場合は保存処理が実行されることになります。


#### CSRF対策
Laravelには一般的な攻撃を防ぐためのセキュリティ対策があらかじめ準備されています。  
そのうちの1つがCSRF対策です。  
CSRFの詳細は説明は本論とずれてしまうため割愛しますが、  
簡単にいうと、ユーザーの意図しない不正な書き込みなどが実施できる脆弱性、  
またはその脆弱性を利用した攻撃のことです。  

Laravelではその脆弱性を防ぐのは非常に簡単で、  
フォームの中に`@csrf`と記述するだけです。    
また、入力漏れがないように、`@csrf`を書いてない場合はフォームの送信時にエラーが表示されます。  

##### 参考リンク

[CSRF保護](https://readouble.com/laravel/5.7/ja/csrf.html)

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
