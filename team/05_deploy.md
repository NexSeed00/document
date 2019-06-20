# リリース

## やること
自分たちが作成したアプリを公開する

## 概要
### 公開するためにやらないといけないこと
1. サーバを用意する
2. ドメインを用意する
3. サーバの設定
4. サーバにファイルをアップロードする(デプロイ)

### サーバを用意する
- リリースするにはサーバが必要
  - 購入する(オンプレミス)
  - 借りる
    - 専用サーバ
    - 共用サーバ
    - VPS
    - クラウド

#### 専用サーバ
- 契約者それぞれが1つの物理的なサーバを割り当てられる
- 高い
- 自由に設定ができる
  - 自分で設定する知識が必要


#### 共用サーバ
- 複数の契約者で1つの物理的なサーバをシェアする
- 安い
- 自由に設定ができない
  - 自分で設定する知識がなくても使用可能

#### VPS
- 1つの物理的なサーバの中に仮想サーバを複数作成、契約者それぞれが1つの仮想サーバを割り当てられる
- 程よい安さ
- 程よく自由に設定ができる

#### クラウド
- VPSのパワーアップ版
- スケールアップ、スケールアウトが簡単
  - スケールアップ = サーバのスペックをあげる
  - スケールアウト = サーバの数を増やす
- 料金はVPSより高い
- IaaS, PaaS, SaaSがある
- 有名なサービス(IaaS)
  - AWS
  - GCP
- 有名なサービス(PaaS)
  - Heroku


### ドメインを用意する
- ドメインとは
  - amazon.co.jp
  - google.com
  - facebook.com
  - etc
- ドメインを設定しないとIPアドレスでアクセスしないといけない
  - なくてもサービスにはアクセスできるがわかりにくい

### サーバの設定
- 必要なソフトのインストール
  - PHP
  - MySQL
  - etc
- セキュリティ対策(ファイアウォールの設定)
- サーバとドメインの紐付け

### サーバにファイルをアップロードする(デプロイ)
- デプロイ
  - アプリを利用可能な状態にすること
- FTPソフトを使用
- Git
  - サーバでGit pullする
- CIツールを使用
  - テストやデプロイを自動で実施してくれるアプリ
    - Circl CI
    - Jenkins
    - etc


## 実践
### 使用するサービス
- Heroku
  - 設定が不要もしくは簡単

### インストールするソフト
- Heroku CLI
- Sequel Pro (Mac)
- Mysql workbench(Windows)
  - MySQLの中身を確認、SQL文を実行したりする必要がある場合のみ
  - phpMyAdminみたいなもの

### 手順
#### 最初の1回のみ
- Herokuアカウントの作成
- クレカ登録
- Heroku CLIのインストール
- Herokuにログイン
  - heroku login

#### アプリごとに実施
- Heroku App作成
  - heroku create {app-name} --buildpack heroku/php
    - heroku buildpacks:set heroku/php
- MySQLのインストール
  - heroku addons:add cleardb
- その他設定
  - 後述
- GitHubと連携
- デプロイ
  - git push heroku master
  - GitHubと連携することでGitHubにpushした時点で更新することも可能
- Laravelの必要なコマンドを実施
- 確認
  - heroku open

### その他設定
- heroku config | grep CLEARDB_DATABASE_URL
```
mysql://(--username--):(--password--)@(--hostname--)/(--dbname--)?reconnect=true
```
- heroku config:set DB_DATABASE=heroku_eb8bcc43c831953
- heroku config:set DB_HOST=us-cdbr-iron-east-02.cleardb.net
- heroku config:set DB_USERNAME=bb1f4444553427
- heroku config:set DB_PASSWORD=50fbf934
- heroku config:set APP_KEY=$(php artisan key:generate --show)
- heroku config:set APP_ENV=heroku

#### Laravelのコードを修正
- `Procfile` という名前のファイルをルートディレクトリに作成
  - `web: vendor/bin/heroku-php-apache2 public/` を記述して保存

- AppServiceProviderに以下記述(https対応)
```php
// AppServiceProvider

public function boot()
{
    if (\App::environment('heroku')) {
        \URL::forceScheme('https');
    }

    Schema::defaultStringLength(191);
}
```

※編集後はgit commitまで実施する

#### Laravelの必要なコマンドを実施
- heroku run composer install
- heroku run php artisan migrate

## 画像を保存する場合
### 画像の保存先(AWSでS3)の準備と各種設定
- AWSアカウント作成
- s3バケット作成
- IAMでユーザー作成

### Laravelの設定
`composer require league/flysystem-aws-s3-v3`

```
heroku config :set AWS_ACCESS_KEY_ID=
heroku config :set AWS_SECRET_ACCESS_KEY=
heroku config :set AWS_DEFAULT_REGION=ap-northeast-1
heroku config :set AWS_BUCKET=

```

## おまけ
#### MySQLを使用しない場合
- Herokuのアカウント作成
- GitHubのアカウントと連携
- デプロイするリポジトリを指定
  - 拡張子が.htmlのファイルだとデプロイできない
  - .htmlだけの場合でも拡張子を.phpに変更する必要がある
- デプロイ

 
### MySQLを使用する場合(例: PHP)
- 上記 + MySQLの設定が必要
- DBの接続先のみ変更

#### Herokuの環境変数を設定
- HOST_NAME: us-cdbr-iron-east-02.cleardb.net
- DB_NAME: heroku_hogefugahoge1234
- USER_NAME: hoge12345
- PASSWORD: fuga12345

#### ソースコードのMySQLの設定を変更
```php
  $host = getenv(HOST_NAME);
  $dbname = getenv(DB_NAME);
  $user = getenv(USER_NAME);
  $password = getenv(PASSWORD);
```


#### 参考リンク
[Heroku](https://drive.google.com/drive/u/0/folders/1V3I57d_GIOaU6OSVlzh9iWvqZXDUkI8C)

[Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli#download-and-install)