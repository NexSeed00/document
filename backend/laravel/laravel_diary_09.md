## 認証機能の作成
コマンド1つで必要なファイル群を作成してくれる
`php artisan make:auth`

### コマンド実行で変更される内容
#### 編集されるファイル
`web.php`
Auth::routes();が追記される
    - 会員登録画面や、ログイン画面へのroute

#### 追加されるファイル(ディレクトリ)
app/Http/Controllers/HomeController.php
	resources/views/auth/
	resources/views/home.blade.php
	resources/views/layouts/

### その他変更する箇所
- アカウント登録した後の画面を変更
RegisterController
```
- protected $redirectTo = '/home';
+ protected $redirectTo = '/';
```

- ログイン後の画面を変更
LoginController
```
- protected $redirectTo = '/home';
+ protected $redirectTo = '/';
```

### 表示するページの制御
#### 一覧以外のページはログインしていないと表示できないようにする
```
Route::group(['middleware' => 'auth'], function() {
    Route::get('diary/create', 'DiaryController@create')->name('diary.create');
    Route::post('diary/create', 'DiaryController@store')->name('diary.store');
    
    Route::get('diary/{id}/edit', 'DiaryController@edit')->name('diary.edit');
    Route::put('diary/{id}/update', 'DiaryController@update')->name('diary.update');
    
    Route::delete('diary/{id}/delete', 'DiaryController@destroy')->name('diary.destroy');    
});
```

#### ログイン前のみ表示できるページのリダイレクト先変更
`app/Http/Middleware/RedirectIfAuthenticated.php`
```
- return redirect('/home');
+ return redirect('/');
```

### おまけ(授業ではやらない)
#### 全画面のheaderにログイン/ログアウトのボタンが表示されるようにする
index.blade.php, create.blad.php, edit.blade.phpを以下のように編集
```
- @extends('layout')

+ @extends('layouts.app')
```

#### validation日本語化(会員登録)
RegisterControllerのvalidatorメソッドを以下の通り編集
```
return Validator::make($data, [
    'name' => 'required|string|max:255',
    'email' => 'required|string|email|max:255|unique:users',
    'password' => 'required|string|min:6|confirmed',
], [], [
    'name' => 'ユーザー名',
    'email' => 'メールアドレス',
    'password' => 'パスワード',
]);
```

jp/valiadtionの必要な項目を編集
```
'confirmed' => ':attribute が確認欄と一致しません。',
'email' => ':attribute として有効な形式になっていません。',
'min' => [
    'string' => ':attribute は :min 文字以上にしてください。',
],
'string' => ':attribute には文字を入力してください。',
'unique' => ':attribute はすでに使用されています。',
```

#### Validationの日本語化(ログイン機能)
`lang/en/auth`を`lang/jp`にコピー
```
'failed' => 'メールアドレスまたはパスワードに誤りがあります。',
```

#### パスワードの初期化
1. mailtrapにアカウント登録
   .envファイルを修正
    ```
    MAIL_DRIVER=smtp
    MAIL_HOST=smtp.mailtrap.io
    MAIL_PORT=2525
    MAIL_USERNAME=mailtrapのユーザー名
    MAIL_PASSWORD=mailtrapのパスワード
    MAIL_ENCRYPTION=null
    MAIL_FROM_NAME="メールの送信者に表示される名前"
    APP_URL=http://localhost:8000
    MAIL_FROM_ADDRESS=メールの送信者のアドレス
    ```
#### 送信されるメールの内容を変更
  `php artisan make:mail ResetPassword`
  作成された`ResetPassword`を以下のように編集
    ```
    class ResetPassword extends Mailable
    {
        use Queueable, SerializesModels;

        private $token;

        /**
         * Create a new message instance.
         *
         * @return void
         */
        public function __construct($token)
        {
            $this->token = $token;
        }

        /**
         * Build the message.
         *
         * @return $this
         */
        public function build()
        {
              return $this->view('mail.resetPassword', [
                  'token' => $this->token,
              ]);
        }
    }
    ```

#### 自分で作成したメールを送信するように`User.php`を編集
    ```
    use App\Mail\ResetPassword;
    use Illuminate\Support\Facades\Mail;

    public function sendPasswordResetNotification($token)
    {
        Mail::to($this)->send(new ResetPassword($token));
    }
    ```

    - パスワード変更後のリダイレクト先変更
    ```
    - protected $redirectTo = '/home';
    + protected $redirectTo = '/';
    ```

