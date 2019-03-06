## CSSとは
CSSは、Cascading Style Sheets（カスケーディング・スタイル・シート）の略で、HTMLで作ったコンテンツを装飾するために使われるものです。  
HTMLのコンテンツをCSSを使って装飾する際、よく「CSSをあてる」という表現が使われます。

ここではCSSの基本知識を学んでいきます。  
HTML概論で作成した、デスクトップ上の「basic」フォルダの中に、次のsample2.htmlを作成しておきましょう。

```html
<!DOCTYPE html>
<html lang="ja">
  <head>
    <title>sample2</title>
    <meta charset="UTF-8">
  </head>
  <body>
    <div>
      <h1>CSSの練習</h1>
      <p>スタイルシートを設定してみましょう。</p>
    </div>

    <p>ここもp要素です。</p>
  </body>
</html>
```


## CSSの使い方
CSSのあて方には大きくわけて3種類あります。

### **インライン**
* スタイルをあてたい要素に、直接style属性を設定する方法です。  
この方法は設定が簡単ですが、変更があった場合にその該当箇所を全て変更することになり、とても非効率です。

```html
<p style="font-size: 20px;">テキスト</p>
```

#### ▼練習問題１
sample2.htmlのp要素のコンテンツに、インライン方式で次のようにCSSをあててみましょう。

```html
<!DOCTYPE html>
<html lang="ja">
  <head>
    <title>sample2</title>
    <meta charset="UTF-8">
  </head>
  <body>
    <div>
      <h1>CSSの練習</h1>
      <!-- ↓ここでスタイルを設定 -->
      <p style="color: red;">スタイルシートを設定してみましょう。</p>
    </div>

    <!-- ↓ここでスタイルを設定 -->
    <p style="color: red;">ここもp要素です。</p>
  </body>
</html>
```
[こちらから動画で作業を確認できます↓](https://youtu.be/P3G1tbAeo_M)

[![こちらから動画で作業を確認できます](https://img.youtube.com/vi/P3G1tbAeo_M/0.jpg)](https://www.youtube.com/watch?v=P3G1tbAeo_M)


### **エンベッド**
* head内にstyle要素を定義し、その中に記述する方法です。  
この方法は、各ページごとに設定が必要なため、こちらも効率的ではありません。

```html
<head>
  <style>
    p {font-size: 20px;}
  </style>
</head>
```

#### ▼練習問題２
sample2.htmlのp要素のコンテンツに、エンベッド方式で次のようにCSSをあててみましょう。

```html
<!DOCTYPE html>
<html lang="ja">
  <head>
    <title>sample2</title>
    <meta charset="UTF-8">
    <!-- ↓ここでスタイルを設定 -->
    <style>
      p {color: blue;}
    </style>
  </head>
  <body>
    <div>
      <h1>CSSの練習</h1>
      <p>スタイルシートを設定してみましょう。</p>
    </div>

    <p>ここもp要素です。</p>
  </body>
</html>
```
[こちらから動画で作業を確認できます↓](https://youtu.be/soQbY7Skclw)

[![こちらから動画で作業を確認できます](https://img.youtube.com/vi/soQbY7Skclw/0.jpg)](https://www.youtube.com/watch?v=soQbY7Skclw)

### **リンク**
* link要素でCSSを参照する方法です。  
この方法だと、HTMLとCSSファイルが分離され、効率よくスタイルをあてることができます。  

index.html

```html
<head>
  <!-- link要素でstyle.cssを読み込む -->
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <p>テキスト</p>
</body>
```

style.css

```css
p {font-size: 20px;}

```

外部スタイルシートにすれば、CSSファイルの修正だけでリンクさせた全てのHTMLファイルに変更が適用されるので、メンテナンス性の向上にも繋がります。  
HTMLに直接スタイルを書くことは、あくまで一時的・限定的な利用にとどめておきましょう。

#### ▼練習問題３
sample2.htmlのp要素のコンテンツに、リンク方式で次のようにCSSをあててみましょう。

```html
<!DOCTYPE html>
<html lang="ja">
  <head>
    <title>sample2</title>
    <meta charset="UTF-8">
    <!-- ↓ここでスタイルシートを読み込む -->
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <div>
      <h1>CSSの練習</h1>
      <p>スタイルシートを設定してみましょう。</p>
    </div>

    <p>ここもp要素です。</p>
  </body>
</html>
```

デスクトップ上の「basic」フォルダの中に、次のstyle.cssを作成しましょう。

```css
p {color: green;}
```
[こちらから動画で作業を確認できます↓](https://youtu.be/-1qdLuqBiOA)

[![こちらから動画で作業を確認できます](https://img.youtube.com/vi/-1qdLuqBiOA/0.jpg)](https://www.youtube.com/watch?v=-1qdLuqBiOA)

## CSSの基本構成・構文
基本的なCSSの書式ルールは、「 **セレクタ { プロパティ: 値; }** 」というシンプルなものです。  
書式の意味としては、「 **どの要素の { 何を: どのようにする; }** 」というパターンで、行末にセミコロン（;）を書きます。
セミコロンで区切っていけば、「何を: どのようにする」という部分を必要に応じて複数追加することが可能です。

<img src="http://hackers.nexseed.net/images/curriculum_images/css_1.png" alt="Overview" style="width: 80%;">

```css
/* p要素の */
p {
  font-size: 20px;  /* フォントサイズを20pxにする */
  padding: 0;       /* padding（内側の余白）を0にする */
  margin: 30px;     /* margin（外側の余白）を30pxにする */
}
```

**プロパティ** は適用するスタイルの種類のことで、 **値** にはそのプロパティごとに用意されたものを必要に応じて書いていきます。
「{プロパティ: 値;}」の部分は **宣言ブロック** 、「プロパティ: 値;」の組み合わせは **宣言** と呼びます。

宣言ブロックで指定した宣言の適用先を、複数指定することも可能です。
適用先を複数指定するには、セレクタをカンマ（,）で区切ります。

```css
p, ul, li {
  font-size: 20px;
  padding: 0;
  margin: 30px;
}
```

CSSにはコメントを書くことができ、「`/*  */`」で囲んだ部分がコメントになります。

```css
/* ここがコメント */
p, ul, li {
  font-size: 20px;
  padding: 0;
  margin: 30px;
}
```

#### ▼練習問題４
練習問題３で作成したstyle.cssを、次のように変更してみましょう。

```css
p {
  color: green;
  font-size: 30px;
  padding: 10px;
  margin: 50px;
  border: 1px solid;
}
```

## セレクタについて
### １．タイプセレクタ
各要素に対するセレクタを **タイプセレクタ** と呼びます。指定した要素にスタイルが適用されます。

<img src="http://hackers.nexseed.net/images/curriculum_images/css_2.png" alt="Overview" style="width: 80%;">


### ２．子孫セレクタ
要素の中の要素（子要素）にスタイルを適用するセレクタを **子孫セレクタ** と呼びます。スペースで区切ってセレクタをつなぎます。  
例えば、「div p」と指定すると、div要素内のp要素にスタイルが適用されます。

<img src="http://hackers.nexseed.net/images/curriculum_images/css_3.png" alt="Overview" style="width: 80%;">

#### ▼練習問題５
練習問題４で作成したstyle.cssを、次のように変更してみましょう。

```css
/* div要素の中のp要素のみにCSSをあてる */
div p {
  color: green;
  font-size: 30px;
  padding: 10px;
  margin: 50px;
  border: 1px solid;
}
```

### ３．IDセレクタ
HTML内で、id属性が記述されている要素にスタイルを適用させる時に使うのが **IDセレクタ** です。
ID名の前に「#」を付けて指定します。  
要素名（タイプセレクタ）を付けて「div#hoge」と書くこともできますが、この場合はdiv要素の中で「id="hoge"」が指定されたものに限定されてしまうので、限定的に使う時以外は注意が必要です。

HTMLのID名は、1つのページ内で重複が許されないので、クラスのようにスペースで繋げて複数のIDを指定することはできません。
ナビゲーションやフッターなど、固有の役割を持つものに使用されます。

```css
#hoge {
  margin: 10px;
  padding: 0 5px 5px 0;
}
```

#### ▼練習問題６
sample2.htmlに、次のタグを追記しましょう。

```html
<div id="practice6">
  ここはid属性を持っています。
</div>
```

style.cssに、次の宣言ブロックを追加しましょう。

```css
#practice6 {
  background-color: gray;
}
```

### ４．クラスセレクタ
HTML内でclass属性が記述されている要素にスタイルを適用させる時に使うのが **クラスセレクタ** です。
クラス名の前に「.」（ピリオド）を付けて指定します。同じ機能を持つ領域や要素に使用します。  
要素名（タイプセレクタ）を付けて「div.global」と指定することもできますが、この場合はdiv要素の中で「class="global"」が指定されたものに限定されてしまいます。
要素名を指定しなければ、複数の要素でクラスセレクタが使えます。

<img src="http://hackers.nexseed.net/images/curriculum_images/css_4.png" alt="Overview" style="width: 80%;">

上記の場合だと、CSSで「div.global」（div要素内のglobal）と限定指定しているため、ul要素で「global」と指定しても反映されません。

なお、HTMLでは1つの要素に複数のクラスを指定することができ、この場合はHTMLのclass属性に複数のクラス名をスペースで繋げて書きます。

#### ▼練習問題７
sample2.htmlに、次のタグを追記しましょう。

```html
<div class="practice7">
  ここはclass属性を持っています。
</div>

<ul class="list">
  <li>リスト１</li>
  <li>リスト２</li>
  <li>リスト３</li>
</ul>
```

style.cssに、次の宣言ブロックを追加しましょう。

```css
.practice7 {
  padding: 10px;
  margin: 10px;
  background-color: orange;
}

.list {
  color: blue;
}
```

## 各セレクタの優先順位について
CSSでは、セレクタの種類が同じ場合、最後に指定したスタイルが適用されますが、種類の異なるセレクタによって同じプロパティが指定された場合、規則に従って優先順位が決定されます。

＜例＞次のように、id属性とclass属性を同時に指定した場合

```html
<p id="xyz" class="abc">何色になる？</p>
```

```css
* {color: purple;} /*全称セレクタ*/
p {color: red;} /*タイプセレクタ*/
.abc {color: orange;} /*要素を特定しないclassセレクタ*/
p.abc {color: yellow;} /*要素を特定したclassセレクタ*/
#xyz {color: green;} /*要素を特定しないidセレクタ*/
p#xyz {color: blue;} /*要素を特定したidセレクタ*/
```

CSSのルールでは、全称セレクタやタイプセレクタより、idセレクタやclassセレクタのような具体性の高いセレクタが優先されます。
また、idセレクタはclassセレクタより優先され、その中でも要素を特定したidセレクタが優先されます。

従って、セレクタの優先順位は、p#xyz > #xyz > p.abc > .abc > p > *となり、 color:blue;が最優先されます。

【参考】[セレクタの優先順位の計算方法](http://qiita.com/oh_rusty_nail/items/e896825cd54e5c0a3666)

#### ▼練習問題８
sample2.htmlとstyle.cssを使って、上記の例を試してみましょう。


## コンテンツの構造
コンテンツの構造は、次のようになっています。

<img src="http://hackers.nexseed.net/images/curriculum_images/css_5.png" alt="Overview" style="width: 80%;"><br>
**コンテンツ < padding（余白） < border（枠） < margin（マージン）**

コンテンツの位置を移動させたい場合はmarginを指定し、コンテンツ内の文字の位置などを移動させたい場合はpaddingを指定します。

### marginの指定について
* margin （値）
    * 上下左右の４方向について、すべて同じマージンを指定する
* margin（上）（右）（下）（左）
    * 上下左右のマージンをそれぞれ別に指定する  
      例：``margin: 10px 5px 10px 5px;``

### paddingの指定について
* padding（値）
    * 上下左右の４方向について、すべて同じ余白を指定する
* padding（上）（右）（下）（左）
    * 上下左右の余白をそれぞれ別に指定する  
      例：``padding: 10px 5px 10px 5px;``

#### ▼練習問題９
sample2.htmlとstyle.cssを使って、margin, padding, borderを変更して確認してみましょう。

sample2.htmlに、次のタグを追記しましょう。

```html
<div>
  <p id="practice9">marginとpaddingの確認です。</p>
</div>
```

style.cssに、次の宣言ブロックを追加しましょう。

```css
#practice9 {
  color: white;
  margin: 30px;
  padding: 20px;
  border: 5px solid red;
  background-color: blue;
}
```

## コードをミスなく書くコツ
* 色を意識しよう
    * VS Codeは、シンタックスハイライトという機能でコードの意味ごとに色分けをしてくれます。
* 補完機能を利用しよう
    * はじめはできるだけ補完機能に助けてもらいながら書くとミスが減ります。

### まとめ
- 見た目を定義する
  - HTMLをどのように装飾するかを指示する
- Cascading Style Sheetsのこと
- 文字や背景の色・大きさ・配置などを指定する
- 書き方は3種類
  - インライン
  - エンベッド
  - リンク
    - 基本的にはリンクを使用する
- 装飾する際のセレクタの指定の仕方で優先順位がある
  - 優先順位が同じ場合は後から読み込まれた方が優先される
- 全ての要素にはcontents, padding, border, marginがある