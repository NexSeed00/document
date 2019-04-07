# SHSシェア  

## 目標
- SNSシェア機能が使えるようになる

## 作成するアプリ
<img src="./img/UserDefaultProject02.gif" width="300px">

## 開発の流れ
1. 画面の部品を配置する
2. タップ処理を追加する
3. スワイプ処理を追加する

## 開発しよう
1. プロジェクトを作成する  
  アプリ名：SNSShareProject

2. 画面の部品を配置する
    1. 以下のような画面になるよう部品を配置する  
        <img src="./img/SNSShareUI.png" width="300px">
  
    2. 配置した部品をViewController.swiftに接続する。
    
        |部品|接続時のName|
        |---|---|
        |UIImageView|imageView|
        |UIButton|didClickButton|

        ![Swiftロゴ](./img/connect_sns.png)

    3. デザインの制約を追加する。
        Main.storyboardで画面を選択し、右下にある「Pinボタン」内の「Add Missing Constraints」を選択する。
        > この作業をすることで、画面サイズによるデザインのずれを解決します。
        ![Swiftロゴ](./img/add_containts.gif)

    4. 画面に配置したImageViewに任意の画像を設定する
        <img src="./img/place_image.png" width="300px">

