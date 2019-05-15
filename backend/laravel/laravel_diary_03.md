## 一覧画面の作成
### 学ぶこと
このカリキュラムでは、一覧画面の作成を通して以下のことを学びます。  
1. ブラウザからURLを入力して、画面が表示されるまでの流れ
2. データベースにテーブルを作成する方法
3. データベースにテストデータを保存する方法

### Routeの設定
まずはルートの設定をします。
ルートでは、**①どのURL(メソッドも含む)の時に**、**②どのコントローラーの**、**③どのメソッドを使用するか**  
を決めます。  

下の例では、
①URLが`/`に`GET`メソッドでアクセスされた場合、②`DiaryController`の③`index`メソッドを使用する。  
ということを決めています。  

※`->name('diary.index')`の部分は画面にリンクを作成する時に使用しますが、  
詳しくは後述します。  
※`//削除`とコメントがついてる部分はサンプルページのため、削除します。  

※編集するファイルの場所はコードの上部に記載します。  

```php
// routes/web.php

Route::get('/', 'DiaryController@index')->name('diary.index'); //追加

//削除
Route::get('/', function () {
    return view('welcome');
});
```

### Controllerの作成
次にコントローラーを作成します。  
Laravelではコントローラーの作成をコマンド1つで行えます。  
以下のコマンドをターミナル(コマンドプロンプト)に入力してください。  

`php artisan make:controller DiaryController`

`app/Http/Controllers`に`DiaryController.php`というファイルが作成されます。  

`DiaryController`にindexメソッドを追加してブラウザから動作確認しましょう(Hello Worldが表示されればOK)
```php
//app/Http/Controllers

class DiaryController extends Controller
{
    public function index()
    {
        return 'Hello World';
    }
}
```

流れとしてはURLを入力してアクセスすると、  
1. web.phpで使用するコントローラーとメソッドの確認
2. 1で指定されたコントローラーのメソッドを実行
となります。


### Modelの作成
次にモデルを作成します。  
Laravelではモデルの作成もコマンド1つで行えます。  
以下のコマンドをターミナル(コマンドプロンプト)に入力してください。  

`php artisan make:model Diary`

`app`に`Diary.php`というファイルが作成されます。  

モデルにはDBの操作などをするコードを書きます。  

### Migrationの作成と実行
#### Migration file作成
`php artisan make:migration create_diaries_table --create=diaries`

yyyy_mm_dd_hhmmii_create_folders_table.phpを編集
```php
public function up()
{
    Schema::create('diaries', function (Blueprint $table) {
        $table->increments('id'); 
        $table->string('title', 30); //追加
        $table->text('body'); //追加
        $table->timestamps();
    });
}
```

#### 実行
`php artisan migrate`
DBを確認

### テストデータの挿入
`php artisan make:seeder DiariesTableSeeder`


DiariesTableSeederを編集
```php
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

public function run()
{
    $diaries = [
        [
            'title' => 'セブでプログラミング',
            'body'  => '気づけばもうすぐ2ヶ月',
        ],
        [
            'title' => '週末は旅行',
            'body'  => 'オスロブに行ってジンベエザメと泳ぎました',
        ],
        [
            'title' => '英語授業',
            'body'  => '楽しい',
        ],
    ];

    foreach ($diaries as $diary) {
        DB::table('diaries')->insert([
            'title' => $diary['title'],
            'body' => $diary['body'],
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ]);
    }
}
```


`php artisan db:seed --class=DiariesTableSeeder`
データが挿入されているか確認


### Controllerにロジックの追加
DiaryControllerを編集
```php
use App\Diary; //追加

public function index()
{
    $diaries = Diary::all(); //diariesテーブルのデータを全件取得

    dd($diaries);
}
```

### Viewの作成
- viewsディレクトリにdiariesディレクトリ作成
- diariesに`index.blade.php`を作成

index.blade.phpを編集
```
Hello View
```

上記viewを表示するため、
DiaryController.phpを編集
```php
public function index()
{
    $diaries = Diary::all(); //diariesテーブルのデータを全件取得

    return view('diaries.index');
}
```

Viewが表示されることが確認できたら、
Modelから取得したデータをViewで表示します。
```php
public function index()
{
    $diaries = Diary::all(); //diariesテーブルのデータを全件取得

    return view('diaries.index',[
        'diaries' => $diaries,
    ]);
}
```

```php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/app.css">
    <title>一覧表示画面</title>
</head>
<body>
    @foreach ($diaries as $diary)
        <div class="m-4 p-4 border border-primary">
            <p>{{ $diary->title }}</p>
            <p>{{ $diary->body }}</p>
            <p>{{ $diary->created_at }}</p>
        </div>
    @endforeach
</body>
</html>
```

### まとめ



