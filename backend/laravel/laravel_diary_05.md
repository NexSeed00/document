## 削除機能の作成
### 今回学ぶこと

### Routeの設定
`Route::delete('diary/{id}/delete', 'DiaryController@destroy')->name('diary.destroy');`

### 一覧画面にリンクを追加
編集の下に以下追加
```
<form action="{{ route('diary.destroy', ['id' => $diary->id]) }}" method="post" class="d-inline">
    @csrf
    @method('delete')
    <button class="btn btn-danger">削除</button>
</form>
```

### Contorollerの編集(削除処理)
```
public function destroy(int $id)
{
    $diary = Diary::find($id);
    $diary->delete();

    return redirect()->route('diary.index');
}
```