# 環境構築

ここでは PHP を自分の PC で実行するための
開発環境の構築を行います。

今回は**XAMPP**を使用します。

## XAMPP とは？

Web アプリケーション開発に欠かすことのできないソフトウェアを、  
無料で一括インストール、管理することができるアプリです。

Web アプリケーションを作成するには、Web サーバ(Apache など)や DB(MySQL など)、プログラミング言語（PHP、Ruby など）が必要ですが、
この 3 つのソフトウェアはそれぞれ別の団体で作成・アップデートされているため、  
開発する際には個別にそれぞれインストールをする必要があります。

これらのソフトウェアのインストール（環境構築）は、  
Web アプリケーション開発初心者には難しく、  
プログラミング学習を実施する前の環境構築で挫折してしまうケースもあります。  
XAMPP を使うことで Mac でも Windows でも簡単に開発環境を構築することができます。

一方で XAMPP の場合、サーバの細かい設定ができないことや、  
サーバの構造が理解しにくいといった欠点もあります。

今回は、まずプログラミングの習得に集中するため、環境構築には XAMPP を使用します。

ちなみに、「XAMPP」という名前は次の頭文字を取ったものです。

- **X**：Windows, Linux, MacOS, Solaris のクロスプラットフォーム（異なる OS でも同じように使うことができる）
- **A**：Apache
- **M**：MySQL（MariaDB） ※MariaDB は、MySQL から派生したデータベース管理システム
- **P**：PHP
- **P**：Perl（PHP と同じく、サーバー側で動くプログラミング言語）

## XAMPP のダウンロード

それぞれの OS に合ったインストーラをダウンロードしてください。

### Mac

https://drive.google.com/drive/u/0/folders/1oeAgJ--en1thoh5uNLjmG9tcV-2ts0Na

### Windows

https://drive.google.com/drive/u/0/folders/1xz10yacfCQNQ32HwI99uFYnM0CA2Hb8L

上記フォルダの「xampp-」で始まるフォルダをダウンロードしてください。

## XAMPP のインストール

ダウンロードした「xampp-」で始まるファイルをダブルクリックしてインストールします。  
イントール画面が立ち上がるため、全て NEXT で進めるとインストールが完了します。  
Mac の場合は、アプリケーションディレクトリの中に、  
Windows の場合は、C ドライブ直下に、  
 **「XAMPP」** ディレクトリがあればインストール完了です。

## XAMPP の起動

インストールが完了すると XAMPP を操作するための小さいウィンドウが表示されます。  
インストール後は自動で起動しますが、  
普段使用する場合は以下の手順に沿って自分で起動する必要があります。

### Mac

Launchpad を起動 → 画面上部の検索 box で「manager-osx」と検索  
→ 表示された manager-osx.app をダブルクリック

### Windows

XAMPP ディレクトリの中にある「xampp-control.exe」をダブルクリック

上記手順で開いた画面が XAMPP の操作画面になります。  
この画面で**Web サーバ**や**DB サーバ**の起動などを行います。  
起動が必要なアプリは以下 2 つです。  
①MySQL  
②Apache  
それぞれ選択したのち、Start ボタンを押下で起動できます。  
※Mac の場合は Manage Servers タブを開く必要があります。

## XAMPP の使い方

XAMPP 環境を使う時は、表示したいページを XAMPP の htdocs ディレクトリに保存します。  
また、ページにアクセスする際は URL のドメインが「localhost」になります。

例えば、htdocs フォルダの直下に「test.html」という HTML ファイルを作って表示させたい場合は、  
「http://localhost/test.html」 とアクセスすることになります。

以下の内容で test.html というファイルを作成して、htdocs 直下に保存した後、  
上記 URL にアクセスしてください。

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

XAMPP テストと表示されれば正しく動作しています。
