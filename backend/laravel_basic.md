## Laravel

## 概要

## ゴール

## やること
### TODOアプリの作成
- 日記アプリに変更するかも

### 機能
ユーザー登録
TODOの投稿、編集、更新、削除

### 手順
#### 目次
##### 説明
- 作成するアプリの動作確認
- 設計紹介
  - 画面遷移図
  - ER図
  - 機能紹介

##### 準備
- Laravelのインストール
- DB作成
- envファイル修正
- cssファイルの追加

##### 開発
- todoアプリ作成
  - 一覧、作成、編集、削除
- 認証機能作成
- エラーハンドリング

- Laravelのインストール
- コントローラーの作成
  - php artisan make:controller TaskController
  - taskControllerルーティング
- DB作成(ORM)
  -  php artisan make:migration create_tasks_table --create=tasks
  -  upメソッド編集
  -  migrate
  -  php artisan make:model Tasks
- Seederでテストデータ投入
  - php artisan make:seeder TasksTableSeeder
  - runに値を追加
  - php artisan db:seed --class=TasksTableSeeder

- コントローラー作成

#### やること
- CSS作成
- todo機能のみに絞って実装
- 認証機能追加
- エラーハンドリング