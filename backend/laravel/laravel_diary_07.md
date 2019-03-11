## Viewファイルの編集
今viewファイルはheadなどが全て同じです。
全く同じ処理を何度も書いてる状態を改善します。
共通部分を切り出し、ページ毎に異なる部分だけを
各ページのファイルに記述するようにします。

### 共通部分を記述するファイルを作成 
- layout.blade.phpを作成
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/app.css">
    <title>@yield('title')</title>
</head>
<body>
    @yield('content')
</body>
</html>
```

### ページごとに内容が変わる部分を修正
- index.blade.php
```
@extends('layout')

@section('title')
一覧
@endsection

@section('content')
<a href="{{ route('diary.create') }}" class="btn btn-primary btn-block">
    新規投稿
</a>
@foreach ($diaries as $diary)
    <div class="m-4 p-4 border border-primary">
        <p>{{ $diary->title }}</p>
        <p>{{ $diary->body }}</p>
        <p>{{ $diary->created_at }}</p>
        <a class="btn btn-success" href="{{ route('diary.edit', ['id' => $diary->id]) }}">編集</a>
        <form action="{{ route('diary.destroy', ['id' => $diary->id]) }}" method="post" class="d-inline">
            @csrf
            @method('delete')
            <button class="btn btn-danger">削除</button>
        </form>
    </div>
@endforeach
@endsection
```

同じ要領で、create.blade.phpとedit.blade.phpも実施してみましょう。