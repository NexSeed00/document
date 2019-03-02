## 認証機能(事前準備)
### 今回学ぶこと

### 事前準備
新たにユーザーのデータを扱うための事前準備をします。
#### user_idカラムをDiariesテーブルに追加
`php artisan make:migration add_user_id_to_diaries --table=diaries`
`php artisan migrate:fresh`
    - `php artisan migrate`だと今までの投稿にuser_idがないため、通常NULLになるが、user_idはNULLを許容せずエラーになるため、作り直す

#### UserとDiaryのリレーションをモデルに追加
```
public function diaries()
{
    return $this->hasMany('App\Diary');
}
```

#### usersテーブルにデータを挿入するSeederの作成
`php artisan make:seeder UsersTableSeeder`

```
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

public function run()
{
    DB::table('users')->insert([
        'name' => 'pikopoko',
        'email' => 'pikopoko@gmail.com',
        'password' => bcrypt('123456'),
        'created_at' => Carbon::now(),
        'updated_at' => Carbon::now(),
    ]);
}
```

#### diariesテーブルにデータを挿入するSeederの編集

```
public function run()
{
    $user = DB::table('users')->first(); //追加

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
            'user_id' => $user->id, //追加
            'created_at' => Carbon::now(),
            'updated_at' => Carbon::now(),
        ]);
    }
}
```

#### DBにデータの挿入
usersとdiariesのseederを同時に実行するために
seeds/DatabaseSeeder.phpを編集
```
public function run()
{
    $this->call(UsersTableSeeder::class);
    $this->call(DiariesTableSeeder::class);
}
```
`php artisan db:seed`
データベースにデータが入ってることを確認する
