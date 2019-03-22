# 環境構築
ここではPHPを自分のPCで実行するための
開発環境の構築を行います。

今回は**XAMPP**を使用します。

## XAMPPとは？
Webアプリケーション開発に欠かすことのできないソフトウェアやツールを、
無料で一括インストールすることができるアプリのことです。  
Webアプリケーションを作成するには、ApacheやMySQL、プログラミング言語（PHP、Rubyなど）が必要ですが、
本来この3つのソフトウェアはそれぞれ別の団体で作成・アップデートされているため、
開発する際には個別にそれぞれダウンロードとインストールをする必要があります。  

これらのソフトウェアのインストール（環境構築）は、Webアプリケーション開発初心者には難しいところがありますが、XAMPPを使うことでMacでもWindowsでも簡単に開発環境を構築することができます。
一方で、XAMPPの場合、サーバの細かい設定ができないことや、
サーバの構造が理解しにくいといった欠点もあります。

まずは、プログラミングの習得に集中するため、環境構築にはXAMPPを使用します。

ちなみに、「XAMPP」という名前は次の頭文字を取ったものです。
* **X**：Windows, Linux, MacOS, Solarisのクロスプラットフォーム（異なるOSでも同じように使うことができる）
* **A**：Apache
* **M**：MySQL（MariaDB） ※MariaDBは、MySQLから派生したデータベース管理システム
* **P**：PHP
* **P**：Perl（PHPと同じく、サーバー側で動くプログラミング言語）

## XAMPPのダウンロード
それぞれのOSに合ったインストーラをダウンロードしてください。
### Mac
https://drive.google.com/drive/u/0/folders/1Hq0eoszD_Fnkva2njVwzb-km-M3GIOqx

### Windows
https://drive.google.com/drive/u/0/folders/1MXO4NDZ2VzZhgUICzmgSB5RHxFbLkYg_

上記フォルダの「xampp-」で始まるフォルダをダウンロードしてください。

## XAMPPのインストール
ダウンロードした「xampp-」で始まるファイルをダブルクリックしてインストールします。
イントール画面が立ち上がるため、全てNEXTで進めるとインストールが完了します。
Macの場合は、アプリケーションディレクトリの中に、
Windowsの場合は、Cドライブ直下に、
 **「XAMPP」** ディレクトリがあればインストール完了です。


## XAMPPの起動
インストールが完了するとXAMPPを操作するための小さいウィンドウが表示されます。
インストール後は自動で起動しますが、普段使用する場合は自分で起動する必要があるため、
どこから起動するか説明します。

### Mac
Launchpadを起動→画面上部の検索boxで「manager-osx」と検索→表示された
manager-osx.appをダブルクリック

### Windows
XAMPPディレクトリの中にある「xampp-control.exe」をダブルクリック


上記手順で開いた画面がXAMPPの操作画面になります。
この画面で**Webサーバ**や**DBサーバ**の起動などを行います。
起動が必要なアプリは以下2つです。
①MySQL
②Apache
それぞれ選択したのち、Startボタンを押下で起動できます。
※Macの場合はManage Serversタブを開く必要があります。

## XAMPPの使い方
XAMPP環境を使う時は、表示したいページをXAMPPのhtdocsディレクトリに保存します。
また、ページにアクセスする際はURLのドメインが「localhost」になります。

例えば、htdocsフォルダの直下に「test.html」というHTMLファイルを作って表示させたい場合は、「http://localhost/test.html」 とアクセスすることになります。

以下の内容でtest.htmlというファイルを作成して、htdocs直下に保存した後、
上記URLにアクセスしてください。
```
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8">
  <title>XAMPPテスト</title>
</head>
<body>
  XAMPPテスト
</body>
</html>
```

XAMPPテストと表示されれば正しく動作しています。