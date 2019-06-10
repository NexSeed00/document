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
  - Iaas - 土地
  - Paas - 家
  - Saas - 部屋
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

### 手順
#### MySQLを使用しない場合
- Herokuのアカウント作成
- GitHubのアカウントと連携
- デプロイするリポジトリを指定
  - 拡張子が.htmlのファイルだとデプロイできない
  - .htmlだけの場合でも拡張子を.phpに変更する必要がある
- デプロイ

#### MySQLを使用する場合
- MySQLのインストール
  - 実施前にクレジットカードの登録が必要
    - account settings -> Bilingから実施
- 環境変数の設定(Heroku)
- ソースコードのMySQLの設定を変更
  - Herokuにアップする用のブランチを作成(例: release)
  - 指定してるDBを変更
    - HOST_NAME
    - DB_NAME
    - USER_NAME
    - PASSWORD
  - get_env


#### 参考リンク
[Heroku](https://drive.google.com/drive/u/0/folders/1V3I57d_GIOaU6OSVlzh9iWvqZXDUkI8C)

mysql://bf0cb4bbca9c16:34b1e348@us-cdbr-iron-east-02.cleardb.net/heroku_9f04bebf73fcad8?reconnect=true


HOST_NAME us-cdbr-iron-east-02.cleardb.net
USER_NAME bf0cb4bbca9c16:34b1e348


us-cdbr-iron-east-04.cleardb.net