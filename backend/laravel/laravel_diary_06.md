## 編集機能の作成
### 今回学ぶこと

### Routeの設定
```
Route::get('diary/edit', 'DiaryController@edit')->name('diary.edit');
Route::put('diary/update', 'DiaryController@update')->name('diary.update');
```

### 一覧画面にリンクを追加
index.blade.phpの繰り返しの中に以下を追加
```
<a class="btn btn-success" href="{{ route('diary.edit', ['id' => $diary->id]) }}">編集</a>
```

### Contorollerの編集(編集画面)
```
public function edit(int $id)
{
    dd($id);
}
```
一覧画面の編集リンクをクリックし、
画面にクリックしたデータのidが表示されることを確認

以下の通り編集
```
public function edit(int $id)
{
    $diary = Diary::find($id);

    return view('diaries.edit', [
        'diary' => $diary,
    ]);
}
```

### Viewの作成(編集画面)
diaries/edit.blade.phpを作成
```
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/css/app.css">
    <title>編集画面</title>
</head>
<body>
    <section class="container m-5">
        <div class="row justify-content-center">
            <div class="col-8">
                @if($errors->any())
                    <ul>
                        @foreach($errors->all() as $message)
                        <li class="alert alert-danger">{{ $message }}</li>
                        @endforeach
                    </ul>
                @endif
                <form action="{{ route('diary.update', ['id' => $diary->id]) }}" method="post">
                    @csrf
                    @method('put')
                    <div class="form-group">
                        <label for="title">タイトル</label>
                        <input type="text" class="form-control" name="title" id="title" value="{{ old('title', $diary->title) }}">
                    </div>
                    <div class="form-group">
                        <label for="title">本文</label>
                        <textarea class="form-control" name="body" id="body">{{ old('body', $diary->body) }}</textarea>
                    </div>
                    <div class="text-right">
                        <button type="submit" class="btn btn-primary">更新</button>
                    </div>
                </form>
            </div>
        </div>
    </section>
</body>
</html>
```
createと違う箇所は3つ
- titleタグの中身
- formのaction
- old()の中身
  - old('title', $diary->title)
    - 第2引数がデフォルト値になる

### Contorollerの編集(更新画面)
```
public function update(int $id, CreateDiary $request)
{
    $diary = Diary::find($id);

    $diary->title = $request->title; //画面で入力されたタイトルを代入
    $diary->body = $request->body; //画面で入力された本文を代入
    $diary->save(); //DBに保存

    return redirect()->route('diary.index'); //一覧ページにリダイレクト
}
```
更新日時は勝手に更新されている

### バリデーション
新規作成の時と同じ条件で問題ないため、
変更なし

### まとめ
ここまで一通りのCRUD機能が完成しました。