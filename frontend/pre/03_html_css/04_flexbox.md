## Flexbox

## 概要
CSSはHTMLを装飾するために使用することは
すでに説明しました。
装飾には主に以下の3つがあります。
1. 要素の配置を決める
2. 要素のサイズを決める
3. 要素の見た目(色など)を決める。

今回学習するFlexboxは**要素の配置を決める**ための
CSSです。


## ゴール
Flexbox関連の以下4つの使い方を理解する

- `display: flex`
- `flex-direction`
- `justify-content`
- `aline-items`

Flexboxには非常に多くのプロパティが存在しますが、
最低限上記4つを使用すればある程度のWebサイトは作成できます。

## 使い方
まずは基本的な使い方です。
文末に使用例のリンクを貼っているので、
まずは文章を読んで、なんとなく概念を理解してください。

Flexboxには**Flexコンテナ**と**Flexアイテム**があります。
FlexコンテナーとはCSSで、**display: flexをつけたHTMLのタグのこと**、
Flexアイテムとは**Flexコンテナ**の子要素のことです。

では、`display:flex`をつけると、何ができるかというと、
Flexアイテムを、Flexコンテナ内で、**縦横自由に配置**することができます。
HTMLの例でブロック要素は縦に並ぶということを説明しましたが、
ブロック要素であっても横に並べることができます。
`display:flex`は自分が動かしたい要素の親要素につけます。
また、`display: flex`をつけると要素は横並びになります。

配置を動かしたいが、並び順は縦のままにしたい場合はFlexコンテナに`flex-direction: column`をつけます。

最後に、配置ですが、中央によせたい、両端によせたいといったことに使用するのが、
`justify-content`と`aline-items`です。
それぞれのプロパティで上下の位置、左右の位置を決めます。
`flex-direction`の内容によって、どちらが上下左右の位置を決めるのか変わります。

|                |flex-direction: row  |flex-direction: column  |
|---             |---                  |---                     |
|justify-content |左右                 |上下                    |
|aline-items     |上下                 |左右                    |

※`flex-direction`を使ってない場合は、`flex-direction: row`と同じです。
上記の各プロパティは全てFlexコンテナにつけます。

また、Flexコンテナは子要素(Flexアイテム)の位置を自由に動かすことができますが、
孫要素(Flexアイテムの子要素)を動かすことはできません。
動かしたい場合は、動かしたい要素の親要素に`display: flex`をつけます。
そのため、ある要素のFlexアイテムが、別のある要素のFlexコンテナになることもあります。

## まとめ
- ## `display: flex`
  - つけた要素がFlexコンテナになる
  - 子要素(Flexアイテム)を自由に動かすことができる

-## `flex-direction`
  - Flexコンテナにつける
  - Flexアイテムの並び順を縦にするか横にするかを決める
  - `flex-direction: column`の場合は縦並び
  - `flex-direction: row`、またはついてない場合は横ならび

-## `justify-content`
  - Flexコンテナにつける
  - `flex-direction: row`、またはついてない場合は**左右**の位置を決める
  - `flex-direction: column`の場合は**上下**の位置を決める

-## `aline-items`
  - Flexコンテナにつける
  - `flex-direction: row`、またはついてない場合は**上下**の位置を決める
  - `flex-direction: column`の場合は**左右**の位置を決める

使用例は以下のWebサイトを確認してください。
[サンプルサイト](https://nexseed.netlify.com/html_css/flexbox/)

他にもプロパティはたくさんあるので、
興味がある方は参考リンクをご参照ください。

## 参考リンク
- [Flexboxチートシート](https://www.webcreatorbox.com/tech/css-flexbox-cheat-sheet)