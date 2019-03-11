## 一覧画面の作成
### 今回学ぶこと

### Routeの設定
```
Route::get('/', 'DiaryController@index')->name('diary.index'); //追加

//削除
Route::get('/', function () {
    return view('welcome');
});
```

### Controllerの作成
`php artisan make:controller DiaryController`

DiaryControllerにindexメソッドを追加してブラウザから動作確認(Hello Worldが表示されればOK)
```
class DiaryController extends Controller
{
    public function index()
    {
        return 'Hello World';
    }
}
```


### Modelの作成
`php artisan make:model Diary`
ファイルが作成されたことを確認
モデルはDBの操作などをする

### Migrationの作成と実行
#### Migration file作成
`php artisan make:migration create_diaries_table --create=diaries`

yyyy_mm_dd_hhmmii_create_folders_table.phpを編集
```
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
```
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
```
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
```
public function index()
{
    $diaries = Diary::all(); //diariesテーブルのデータを全件取得

    return view('diaries.index');
}
```

Viewが表示されることが確認できたら、
Modelから取得したデータをViewで表示します。
```
public function index()
{
    $diaries = Diary::all(); //diariesテーブルのデータを全件取得

    return view('diaries.index',[
        'diaries' => $diaries,
    ]);
}
```

```
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



