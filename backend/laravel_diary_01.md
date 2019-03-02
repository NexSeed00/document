# LaravelでWebアプリを作成
## アプリの概要と事前準備

### 概要
このカリキュラムではLaravelを使用した
Webアプリケーション(日記アプリ)を作成します。
実際にWebアプリケーションを作成することで、
開発の手順や、Laravelの機能などについて学んでいきます。

### 日記アプリ詳細
今回は全8ページからなる日記アプリを作成します

### 事前準備
#### laravel
- プロジェクトの作成
  - 任意のフォルダに移動
    - 例
      - mkdir ~/Desktop/NexSeed/Laravel
      - cd ~/Desktop/NexSeed/Laravel
  - composer create-project laravel/laravel --prefer-dist Diary 5.7
- .envファイルの編集
  ```
  DB_DATABASE=Diary
  DB_USERNAME=root
  DB_PASSWORD=
  DB_SOCKET=/Applications/XAMPP/xamppfiles/var/mysql/mysql.sock
  ```

#### DBの作成
- Diaryという名前のDBを作成する

#### MySQLのバージョンが5.7.7未満の場合
AppServiceProviderを編集
```
use Illuminate\Support\Facades\Schema; //追加

public function boot()
{
    Schema::defaultStringLength(191); //追加
}
```


##### 参考
https://laravel-news.com/laravel-5-4-key-too-long-error

#### 起動確認
- プロジェクトのルートディレクトリに移動
- `php artisan serve`でビルトインサーバを起動
- localhost:8000にブラウザからアクセス
- laravelのTOPページが表示されていることを確認する
