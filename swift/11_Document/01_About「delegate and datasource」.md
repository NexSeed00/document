# DelegateとDatasourceについて

## 概要
UITableViewやUICollectionView, UIPickerViewを使うとき、  
〇〇Delegateと〇〇Datasourceというのが出てきたと思います。  
ここでは、この2つについて解説していきます。

## Delegate, Datasource = プロトコル
プロトコルという言葉を聞いたことがありますか？  
プロトコルは**約束事**という意味があります。  
実は、DelegateとDatasourceは2つともプロトコルです。  
では、一体どんな約束事がDelegateとDatasourceには含まれているのでしょうか。  
ここから、UITableViewを例に取り上げて、DelegateとDatasourceについて更に学習していきます。

## UITableViewDataSource
UITableViewDataSourceの約束事を簡単に説明すると、「テーブルの表示に関する約束事」です。

### UITableViewDataSourceに含まれる約束事
以下にUITableViewDataSourceに含まれる約束事をいくつか紹介します。

|内容|メソッド|必須（○：必須、☓：任意）|
|---|---|---|
|テーブルの行数の設定|tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int|○|
|1行1行のセルの内容の設定|tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell|○|
|ヘッダーのタイトルを設定|tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?|☓|
|フッターのタイトルを設定|tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?|☓|

## UITableViewDelegate
UITableViewDelegateの約束事を簡単に説明すると、「テーブルの操作に関する約束事」です。

## UITableViewDelegateに含まれる約束事
以下にUITableViewDelegateに含まれる約束事をいくつか紹介します。

|内容|メソッド|必須（○：必須、☓：任意）|
|---|---|---|
|セルが選択された時の処理|tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)|☓|
|セルの高さの設定|tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat|☓|
