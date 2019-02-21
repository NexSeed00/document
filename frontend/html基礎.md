# HTML基礎

昨今では、様々なデバイスがインターネットに接続しWebページを閲覧するようになりました。そのような中、HTMLやCSSも進化し、Webページ上でとてもリッチなコンテンツや更にはゲームのような高度なコンテンツも動作するようになりました。

ここでは、Webページの記述言語であるHTMLや、ページを装飾するCSSの基礎的な内容について学んでいきます。

## 概要
HTMLは、**HyperText Markup Language** の略で、Webページを記述するための **マークアップ言語** です。  
マークアップ言語とは、プログラミング言語とは異なり、文書の構造や見栄えを **タグ** （<>）と呼ばれる記号を使って表現する言語です。  
直訳すると「ハイパーテキストをマークアップする言語」となりますが、ハイパーテキストとは文書内の任意の場所に他の文書の参照を埋め込み、複数の文書を結びつけたもののことを指します。 
HTMLでいうところの`<a>`タグになります。（`<a>`タグについては後ほど紹介）

HTMLは、タグを階層化して構成されています。
HTMLで書かれたWebページは、ブラウザに読み込まれます。
ブラウザに読み込まれたHTMLは人間の目で見てわかりやすい形式に変換され
画面に表示されます。

HTMLのファイルは、必ず「 **○○○.html** 」という形式で記述する必要があります。
ドットより前の文字列については、URLでアクセスする場合を考慮して半角英数字にします。

## HTMLタグの書式と各部の名称
ここでは、HTMLの各部の名称と基本的な用語について説明します。

HTMLは、テキストや画像などの「コンテンツ」を、タグで意味づけします。  
タグにはいろいろな種類があって、コンテンツの意味によって使い分けます。
ここではタグの各部の名称と役割を確認しておきましょう。

<img src="http://hackers.nexseed.net/images/curriculum_images/js_1.png" alt="Overview" style="width: 80%;">

「タグ」という時は、開始タグと終了タグを合わせたものを指し、コンテンツは含みません。コンテンツ全体を指す時は「要素」といいます。  
また、開始タグに含まれる「属性」と「属性値」は、タグにオプション的な情報を追加するのに使われます。

## HTMLの構文ルール
HTMLは、開始タグと終了タグで一つの要素となる場合と、一つのタグのみで成り立つ場合の2パターンがあります。  
開始タグと終了タグが必要なタグの場合は、開始タグと終了タグの間に、表示したいコンテンツを記述します。終了タグには「/」が必要です。

```html
<h1>NexSeed</h1>
```

一つのタグのみで成り立つタグの場合は、コンテンツをタグで挟むことなく、タグのみで要素を構成できます。

```html
<img src="http://hackers.nexseed.net/images/curriculum_images/logo.jpg" alt="Overview" style="width: 80%;">
```


## HTMLの基本構成
HTMLは複数のタグで構成されます。

まず、`<!DOCTYPE html>`をファイルの一番上に書き、HTML5を使用することを宣言します。  
その下に、ファイルのコード全体を`<html>`タグで囲み、その`<html>`タグの中に、`<head>`タグと`<body>`タグを追加します。  
`<head>`タグはファイルの設定情報を記述するエリアで、
`<body>`タグはブラウザに表示するためのコンテンツを記述するエリアになります。

`<html>`タグのlang属性に「ja」を指定して、このHTMLが日本語で書かれていることを示します。  
`<meta>`タグのcharset属性に文字コード「UTF-8」を指定して、日本語が文字化けせずブラウザに表示されるようにします。  
（文字化け：文字が表示されるコードが異なり、変な文字として表示されてしまう現象のこと）

```
html
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="UTF-8">
    <title>NexSeed</title>
  </head>
  <body>
    ここに書いたものがブラウザに表示される
  </body>
</html>
```

## headとbody
### head
`<head>`タグ内には、HTMLファイルのメタデータを記述します。タイトルやファイルの説明、文字コードや他のリソースへのリンクなどがヘッダーに書かれます。代表的なタグを見てみましょう。

* **titleタグ**
    * HTMLファイルのタイトルを表します。  
      W3C（Webで利用される技術の標準化をすすめる国際的な非営利団体）の仕様によると、「Every HTML document must have a TITLE element in the HEAD section.」と書かれています。従って、titleタグはHTMLファイル内で必ず定義したほうが良いでしょう。

```
html
<!DOCTYPE html>
<html>
  <head>
    <title>タイトル</title>
  </head>
  <body>

  </body>
</html>
```

* **metaタグ**
    * HTMLでは、HTMLファイルに関する様々な情報を定義することができます。  
そのような場合には、metaタグを使います。meta要素では、「プロパティ=値」の組み合わせで指定します。

```
html
<!-- ページの概要 -->
<meta name="description" content="フィリピン・セブ島留学のネクシードは、グローバル人材を育成するための学校です。">

<!-- ページのキーワード -->
<meta name="keywords" content="NexSeed,フィリピン留学,セブ島,語学留学,語学学校,英語,ビジネス英語">

<!-- ページの文字コード -->
<meta charset="UTF-8">
```


> HTMLファイルでは、`<!--  -->`で文字を囲むとコメントとして判別され、ブラウザがHTMLファイルを読み込む際に表示する対象として処理されなくなります。  
コードの中にメモを残したり、講義中の内容を書き入れたりする時に使います。

### body
ファイルの内容そのもの、いわゆるページのメインコンテンツがこのセクションに書かれます。

#### ▼練習問題１
デスクトップに「basic」フォルダを作成し、その中に次のsample.htmlを作成してブラウザで表示してみましょう。

```
html
<!DOCTYPE html>
<html lang="ja">
  <head>
    <title>sample</title>
    <meta charset="UTF-8">
  </head>
  <body>
    <h1>練習問題１：ボディ</h1>
    <p>はじめてのHTML</p>
  </body>
</html>
```
こちらの動画をクリックすると練習問題1を解いている動画が確認できます
[![こちらで練習問題1を解いている動画が確認できます](http://img.youtube.com/vi/NBb0ofNdTGE/0.jpg)](http://www.youtube.com/watch?v=NBb0ofNdTGE)

## ブロック要素とインライン要素
HTMLファイルは、複数のタグでマークアップされた要素から構成されますが、要素は大きくわけて **ブロック要素** と **インライン要素** にわけられます。

### ブロック要素
ブロック要素は、HTML文書の骨格となる要素です。  
ブロック要素には、`<h1>~<h6>`タグや`<p>`タグ、`<div>`タグなどがあります。ブロック要素は、Webブラウザ上で長方形の領域として表示され、通常は **要素の後に改行が入ります** 。  
ブロック要素内には、別のブロック要素やインライン要素を入れることができます。

#### ▼練習問題２
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```
html
<div>
  <h1>練習問題２：ブロック要素</h1>
  <p>ここは段落なのでブロック要素です。</p>
  ここで改行されます。
</div>
```

### インライン要素
インライン要素は、基本的にブロック要素の中身に存在します。  
コンテンツの一部に特別な意味を持たせたり、特殊な動作をさせたりする時に使います。インライン要素には、リンクを表示する`<a>`タグや、強調を表す`<strong>`タグなどがあります。  
インライン要素は、ブロック要素のような特定の形を持ちません。Webページのレイアウトによっては一行に収まる場合もありますし、複数行にまたがる場合もあります。  
インライン要素の中にはインライン要素を入れることができますが、ブロック要素を入れることはできません。

#### ▼練習問題３
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```
html
<div>
  <h1>練習問題３：インライン要素</h1>
  <p>文章のうち、<strong>この部分</strong>が強調されます。</p>
</div>
```

## 改行と空白
HTMLでは、改行も空白文字類として扱われます。HTMLコード内で改行をしても、Webブラウザでは改行はされません。  
改行を表現するには`<br>`タグを使います。また、語と語の間にスペースを入れたい場合は、適切な要素を使うかスタイルを指定して、スペースを確保します。
HTMLコード内に複数のスペースを入れたとしても、ブラウザではそのとおりに表示されません。

## タグの属性
### id属性とclass属性
`<body>`タグ内では複数のタグを記述してコンテンツを構成しますが、タグの属性には共通して **id属性** と **class属性** を指定することができます。

|属性|説明|
|:--|:--|
|id|id属性は、タグに名前を設定します。<br>この名前は **1ファイル内で一意** でなければなりません。|
|class|class属性は、タグに対して一つ、または複数の名前を設定します。<br>複数のタグに対しても、同じ名前を割り当てることができます。<br>複数の名前を一つのタグに割り当てる場合は、空白文字で区切ります。|

#### ▼練習問題４
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```
html
<div id="main">
  <h1>練習問題４：id属性とclass属性</h1>
  <div class="section">
    <p>ひとつめの段落です。class属性に1つの名前が割り当てられています。</p>
  </div>

  <div class="section row">
    <p>ふたつめの段落です。class属性に複数の名前が割り当てられています。</p>
  </div>
</div>
```

### style属性
HTMLでは、要素に対して装飾を表す指定をすることができます。style属性を使います。  
しかし、通常は装飾はスタイルシートという外部リソースを使って行います。（スタイルシートについてはCSSのところで解説）

#### ▼練習問題５
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```
html
<div>
  <h1>練習問題５：style属性</h1>
  <p>この文章のうち、<span style="font-size: 20px; color: red;">この部分</span>をspanタグで囲みます。</p>
</div>
```


## 主要なタグ
上記では、HTMLの基本的な構造について見てきました。  
説明の中でいくつかHTMLのタグを使いましたが、これらはどれもよく使用される基本的なタグです。  
ここからは、HTMLでよく使われる主要なタグについて説明していきます。

### ①div, span（要素のグループ化）
`<div>`タグはそれ自身は特に意味を持っていませんが、`<div>`タグで囲んだ範囲をひとかたまりとして、属性を指定したりスタイルシートを適用するのに使います。  
`<span>`タグも`<div>`タグと同様の使い方をしますが、`<span>`タグはインライン要素で`<div>`タグはブロック要素になります。

#### ▼練習問題６
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div class="section">
  <h1>練習問題６：divタグ、spanタグ</h1>
  <p>ここは段落です。<span style="color: red;">ここはspanタグで囲まれています。</span>ここは段落です。</p>
</div>
```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_3.png" alt="Overview" style="width: 80%;">

- - -
### ②h1, h2, h3, h4, h5, h6（見出し）
見出しを表します。見出しのレベルに合わせて1から6までの要素を指定できます。

#### ▼練習問題７
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div>
  <h1>練習問題７：見出し</h1>
  <h2>見出し２</h2>
  <h3>見出し３</h3>
  <h4>見出し４</h4>
  <h5>見出し５</h5>
  <h6>見出し６</h6>
</div>
```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_4.png" alt="Overview" style="width: 80%;">

- - -
### ③行と段落
#### p（段落）
p要素で囲まれた文字列は、段落区切りを示します。ブロックレベル要素をコンテンツに含めることはできません。

```html
<p>ここは最初の段落です。</p>
```

#### br（行区切りの強制）
brで行を強制的に区切ることができます。

```html
<p>ここは最初の段落です。<br>ここで改行されます。</p>
```

#### pre（整形済みテキスト）
整形済みテキストの略で、ソースに記述されたスペース・改行などを、そのまま等幅フォントで表示します。

```html
<pre>
  Class PreTag{
    public function pre() {
      echo 'preはそのまま表示します。';
    }
  }
</pre>

```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_5.png" alt="Overview" style="width: 80%;">

#### ▼練習問題８
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div>
  <h1>練習問題８：行と段落</h1>
  <p>ここは段落です。<br>ここで改行します。</p>
  <pre>
    ここは
    そのまま
    表示されます。
  </pre>
</div>
```

- - -
### ④リスト
#### ul（順不同リスト）、ol（序列リスト）、li（リスト項目）
順番に依存しないリストは「ul」、順序に意味のあるリストは「ol」タグを使います。リストの項目は「li」タグで囲みます。  
リストは入れ子にできますが、「ul」と「ol」を混在させることは推奨されません。

```html
<ul>
  <li>項目A</li>
  <li>項目B</li>
</ul>

<ol>
  <li>項目1</li>
  <li>項目2</li>
</ol>
```

```html
<!-- こういう書き方はNG！ -->
<ul>
  <ol>
    <li>項目</li>
  </ol>
</ul>
```

#### ▼練習問題９
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div>
  <h1>練習問題９：リスト</h1>
  <p>エンジニア留学が掲げる、最高の学習に必要な３つの柱</p>
  <ul>
    <li>カリキュラム</li>
    <li>講師</li>
    <li>生徒自身のモチベーション</li>
  </ul>

  <p>Basicコースは次のように進めます。</p>
  <ol>
    <li>Webの仕組み</li>
    <li>HTML</li>
    <li>CSS</li>
    <li>テンプレート</li>
    <li>サーバ環境構築</li>
    <li>PHP基礎</li>
    <li>データベース基礎</li>
    <li>応用課題</li>
  </ol>
</div>
```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_6.png" alt="Overview" style="width: 80%;">

- - -
### ⑤テーブル
テーブルの構成要素には、以下のようなものが存在します。

* caption
    * 表の性質に関する記述、いわゆる表題を記述します。複数のcaptionを含んではいけません。
* table
    * テーブルの枠になります。border属性で枠線を指定できます。
* thead, tbody, tfoot
    * 表のヘッダやボディ、フッタをグループ化します。
* tr
    * 行要素です。
* th, td
    * セル要素です。thは見出し用のセルに使用します。

#### ▼練習問題１０
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div>
  <h1>練習問題１０：テーブル</h1>
  <table border="1">
    <caption>表題</caption>
    <thead>
      <tr>
        <th>ヘッダ１</th>
        <th>ヘッダ２</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>１ー１</td>
        <td>２ー１</td>
      </tr>
      <tr>
        <td>１ー２</td>
        <td>２ー２</td>
      </tr>
    </tbody>
  </table>
</div>
```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_7.png" alt="Overview" style="width: 80%;">

#### 列・行の結合
「rowspan」「colspan」属性で指定可能です。  
行の結合はrowspan属性を指定します。

```html
<table>
  <caption>表題</caption>
  <thead>
    <tr>
      <th>ヘッダ１</th>
      <th>ヘッダ２</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2">１ー１</td>
      <td>２ー１</td>
    </tr>
    <tr>
      <!-- <td>１ー２</td> -->
      <td>２ー２</td>
    </tr>
  </tbody>
</table>
```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_8.png" alt="Overview" style="width: 80%;">

列の結合はcolspan属性を指定します。

```html
<table>
  <caption>表題</caption>
  <thead>
    <tr>
      <th>ヘッダ１</th>
      <th>ヘッダ２</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2">１ー１</td>
      <!-- <td>２ー１</td> -->
    </tr>
    <tr>
      <td>１ー２</td>
      <td>２ー２</td>
    </tr>
  </tbody>
</table>
```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_9.png" alt="Overview" style="width: 80%;">


- - -
### ⑥リンク
#### 外部リソースへのリンク
aタグを使って、外部リソースの訪問先を指定できます。target属性に「_blank」を指定することで、新規ウィンドウでリンク先を表示できます。

#### ▼練習問題１１
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div>
  <h1>練習問題１１：リンク</h1>
  <a href="http://nexseed.net" target="_blank">NexSeed</a>
</div>
```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_10.png" alt="Overview" style="width: 80%;">

#### HTML文書内へのリンク
aタグまたはid属性を使って、HTML文書内へのリンクを指定することもできます。

```html
<a href="#section-01">概要へ移動します</a>
<!-- a要素を使う書き方 -->
<h2><a name="section-01">概要</a></h2>
```

```html
<a href="#section-01">概要へ移動します</a>
<!-- id属性を使う書き方 -->
<h2 id="section-01">概要</h2>
```

#### ▼練習問題１２
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div>
  <h1>練習問題１２：ページ内のリンク</h1>
  <a href="#link1">練習問題２へ</a>
</div>
```

```html
<!-- 練習問題２のdivタグに、id属性を追加します -->
<div id="link1">
  <h1>練習問題２：ブロック要素</h1>
  <p>ここは段落なのでブロック要素です。</p>
  ここで改行されます。
</div>
```

- - -
### ⑦画像
imgタグで指定します。ブラウザは、imgタグを見つけると、src先のリソースを読み込みます。

#### ▼練習問題１３
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div>
  <h1>練習問題１３：画像</h1>
  <img src="http://nexseed.net/images/logo.jpg" alt="NexSeedロゴ">
</div>
```
<img src="http://hackers.nexseed.net/images/curriculum_images/html_13.png" alt="Overview" style="width: 80%;">

- - -
### ⑧フォーム
HTMLで表示可能な入力フォームには、テキストボックスやチェックボックス、セレクトボックスやラジオボタンなどのコントロール要素があります。  
通常、各コントロール要素には、コントロール名であるname属性とその値を示すvalue属性を持ちます。  
これらの値は、フォームをサブミットした際に、サーバー側で名前と値のペアとして受け取ることができます。

#### ▼練習問題１４
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div>
  <h1>練習問題１４：フォーム</h1>
  <form action="" method="post">
    <div>
      <!-- テキストボックス -->
      メール：<input type="text" name="email" value=""><br>
      <!-- パスワード用のテキストボックス -->
      パスワード：<input type="password" name="password" value=""><br>
    </div>

    <div>
      <!-- セレクトボックス -->
      <select name="list">
        <option value="item1">アイテム１</option>
        <option value="item2" selected>アイテム２</option>
        <option value="item3">アイテム３</option>
      </select>
    </div>

    <div>
      <!-- チェックボックス -->
      <input type="checkbox" name="fruit" value="apple"> りんご
      <input type="checkbox" name="fruit" value="orange" checked=""> みかん
    </div>

    <div>
      <!-- ラジオボックス -->
      <input type="radio" name="region" value="kanto">関東
      <input type="radio" name="region" value="tokai">東海
      <input type="radio" name="region" value="tyubu">中部
      <input type="radio" name="region" value="tyugoku" checked>中国
      <input type="radio" name="region" value="kyusyu">九州
    </div>
    <!-- フォームデータ送信ボタン -->
    <input type="submit" value="送信">
  </form>
</div>
```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_14.png" alt="Overview" style="width: 80%;">

- - -
### ⑨スクリプト
スクリプトとは、HTML文書と連携するか、または文書に直接組み込まれるようなプログラムのことです。  
このプログラムは、文書がクライアント環境に読み込まれる際に実行されたり、リンクがアクティブになった際などに実行されたりします。代表的なものにJavascriptがあります。  
スクリプトを埋め込むには、script要素を使います。head要素やbody要素内に記述することができます。

#### ▼練習問題１５
sample.htmlのbodyタグ内に、次のタグを追記してみましょう。

```html
<div>
  <h1>練習問題１５：スクリプト</h1>
  <script type="text/javascript">
    function sayHello() {
      alert('Hello!');
    }
  </script>
  <input type="button" onclick="sayHello();" value="Hello">
</div>
```

<img src="http://hackers.nexseed.net/images/curriculum_images/html_15.png" alt="Overview" style="width: 80%;">


## 実体参照
HTML文書内で特別な意味を持つ記号（＜や＞）は、実体参照文字を使って表現します。以下に代表的なものをあげておきます。

|文字実体参照|説明|
|:--:|:--|
|` `|スペース|
|`<`|<|
|`>`|>|
|`&`|&|
|`"`|"|
