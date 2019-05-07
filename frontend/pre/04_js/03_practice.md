## JavaScript練習問題

### 学ぶこと
このカリキュラムでは前のカリキュラムで学んだ
JavaScriptの基本構文を使用して練習問題を解きます。

可能な限り自分で考えて解くことが望ましいですが、
難しい問題もあるため、
必要に応じて回答を確認いただいて構いません。
回答を確認した場合は、**なぜそうなるのか**を
しっかり理解できるようにしましょう。

また、ご自身で解くことができた場合も
ぜひ回答と比べてみてください。
同じ問題でも回答が複数ある場合が多いです。

### ゴール
1. 練習問題を解くことができる。
2. 練習問題の解き方を自分で説明することができる。

### 始め方
`question/js/practice`が練習問題のフォルダです。
問題は`question/js/practice/app.js`に記載されています。
回答も同じファイルに記述ください。
結果は`question/js/practice/index.html`をブラウザで開き、
console.logにてご確認ください。

### 練習問題
1. 偶数と奇数の判定

<details><summary>回答例</summary>
<div>

```JavaScript
//if文
let i = 2;
if (i % 2 === 0) {
    console.log(`${i}は偶数です`);
} else {
    console.log(`${i}は奇数です`);
}

//Switch文
switch (i % 2 === 0) {
    case true:
        console.log(i + 'は偶数です');
        break;
    default:
        console.log(i +  'は奇数です');
        break;
}

```

</div>
</details>
<br>


2. 合格判定
<details><summary>回答例</summary>
<div>

```JavaScript
let math = 50;
let english = 100;
let total = math + english;
if (math >= 60 && english >= 60 && total >= 140) {
  console.log('合格');
} else {
  console.log('不合格');
}
```

</div>
</details>
<br>

3. 数を数える
<details><summary>回答例</summary>
<div>

```JavaScript
let res = 0;
let numbers = [1, 3, 4, 5, 8, 9, 3, 3];
for (let number of numbers) {
    if (number === 3) {
        res++;
    }
}
console.log(res);
```

</div>
</details>
<br>

4. 3倍した数を表示する
<details><summary>回答例</summary>
<div>

```JavaScript
for (let i = 1; i <= 10; i++) {
    console.log(i * 3);
}
```

</div>
</details>
<br>

5. FizzBuzz
<details><summary>回答例</summary>
<div>

```JavaScript
for (let i = 1; i <= 100; i++) {
  if (i % 5 === 0 && i % 3 === 0) {
    console.log('FizzBuzz');
  } else if (i % 5 === 0) {
    console.log('Buzz');
  } else if (i % 3 === 0) {
    console.log('Fizz');
  } else {
    console.log(i);
  }
}
```

</div>
</details>
<br>

6. 九九
<details><summary>回答例</summary>
<div>

```JavaScript
for (let i = 1; i <= 9; i++) {
  for (let j = 1; j <= 9; j++) {
    let res = i * j;
    console.log(res);
  }
}
```

</div>
</details>
<br>

7. 繰り返しの中断、スキップ
<details><summary>回答例</summary>
<div>

```JavaScript
for (let i = 1; i <= 9; i++) {
  for (let j = 1; j <= 9; j++) {
    let res = i * j;
    if (res >= 30) {
      continue;
    }
    console.log(res);
  }
}
```

</div>
</details>
<br>

### チャレンジ問題
練習問題で物足りないという方はチャレンジしてみてください。  
実施は必須ではありません。  
非常に難しい問題なので解けなくても問題ありません。

1. 女湯問題
<details><summary>回答例</summary>
<div>

```JavaScript
let customer = {age: 28, gender: 'male'};

if (customer['gender'] === 'female')  {
  console.log('入れます');
} else {
  if (customer['age'] <= 3) {
    console.log('入れます');
  } else {
    console.log('入れません');
  }
}
```

</div>
</details>
<br>

2. 素数を表示するプログラム
<details><summary>回答例</summary>
<div>

```JavaScript
for (let i = 2; i < 100; i++) {
  for (let j = 2; j <= i; j++) {
    if (i % j === 0 && j < i) {
      break;
    } 

    if (i === j) {
      console.log(i);
    }
  }
}

/**
 * 問題の解き方は複数あり、この解き方も改善の余地があります。
 * 偶数の場合は2で割り切れるので素数にならない(2は除く)
 * 割る数が割られる数の半分以上になった場合は割り切れないので判定不要など
 */
```

</div>
</details>
<br>