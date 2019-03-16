# 制御文〜switch文編〜

## このカリキュラムの目標
1. 〇〇の場合は△、☓☓の場合は□のような条件分岐がプログラムで書けるようになる。

## 導入
条件によって処理を分ける書き方には、if文の他にswith文という書き方があります。  
if文との違いを理解し、switch文も使えるようになりましょう。

### switch文
変数の値が、Aならこの処理、Bならこの処理、Cならこの処理、など色々な値と順次比較して一致する場合毎に処理を記述する場合があります。if文を使うと次のように記述できます。

```
var value = "A"

if value == "A" {
    // 処理
} else if value == "B" {
    // 処理
}else if value == "C" {
    // 処理
}else if value == "D" {
    // 処理
} else {
    // 処理
}
```

これはこれで間違いではないのですが、このような用途の場合にはswitch文を使うと便利です。 switch文の書式は次の通りです。
#### switch文の書き方

```
switch 値や式 {
    case 値1:
        // 処理
    case 値2:
        // 処理
    case 値3:
        // 処理
    case 値4:
        // 処理
    default:
        // 値や式がいずれの値とも等しくない場合の処理
}
```

例

```
var value = "A"
switch value {
    case "A":
        print("Aです")
    case "B":
        print("Bです")
    case "C":
        print("Cです")
    case "D":
        print("Dです")
    default:
        print("上記以外です")
}
```


switch文はif文と異なりcaseで条件となる値や変数をいくつか指定して、一致するcase文の処理を実行します。

### 練習問題
以下の変数を用意してください。

|変数名|値|
|---|---|
|num|任意の数値|

以下の条件に合うようにswitch文を作成してください。

|条件|条件に合致する場合、出力する文字|
|---|---|
|1|1です|
|2|2です|
|3|3です|
|4|4です|
|5|5です|
|それ以外の場合|1,2,3,4,5以外です|

<details><summary>回答例</summary><div>

```
switch num {
    case 1:
        print("1です")
    case 2:
        print("2です")
    case 3:
        print("3です")
    case 4:
        print("4です")
    case 5:
        print("5です")
    default:
        print("1,2,3,4,5以外です")
}
```
</div></details>