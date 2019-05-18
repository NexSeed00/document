# いいね機能の作成

## 学ぶこと
このカリキュラムでは、いいね機能の作成を通して以下のことを学びます。  

## 事前準備

## いいねボタンの作成

## 参考リンク
[fantawesome](https://fontawesome.com/)

## JavaScript/jQueryの読み込み

```JavaScript
$( function() {
    $('.js-like').on('click', function() {
        console.log(1);
    })
});
```

## テーブルの追加

```php
 php artisan make:migration create_likes_table --create=likes


Schema::create('likes', function (Blueprint $table) {
    $table->increments('id');
    $table->integer('diary_id');
    $table->integer('user_id');
    $table->timestamps();
});

php artisan migrate

php artisan make:model Like
```

## いいね機能の実装(Ajax)

```php
```

### 参考リンク
[コレクション](https://readouble.com/laravel/5.7/ja/collections.html)

## いいね解除

## 投稿削除でいいねもまとめて削除

## まとめ