# Neovimチートシート
```
memo            このメモ帳を開くためのコマンド
ew              保存
eq              保存して終了
Q               強制終了
<Ctrl>s         :%s///g
B				一番近い空行に移動
```
## search
```
<ESC><ESC>      検索結果のハイライトを消去
S               FuzzyMotion
<Ctrl>c         文字数カウント
```
## buffer
```
<Space>q        現在のバッファを削除
]p              前のバッファに移動
]n              次のバッファに移動
```
## nvim-lsp
```
K               カーソル下のシンボルに関する情報を表示
lc              変数名・関数名一括変換
lj              コードアクションを実行
l[              前のエラー箇所に移動
l]              後のエラー箇所に移動
lf              ファイル全体のフォーマット
```
## telescope
```
<Space>.        プロジェクト全体のファイルを表示
<Space>,        ファイル履歴を表示
<Space>s        プロジェクト全体のワード検索
<Space>k        バッファ全体のワード検索
<Space>b        開いているバッファを表示
<Space>v        vimのヘルプタグを解説
<Space>y        クリップボードにあるテキストを表示
gd              カーソル下の単語の定義
gr              カーソル下の単語の参照
gi              カーソル下の単語の実装
gx              現在開いているバッファの診断情報
<Space>f        ファイルブラウザ
```
## nvim-cmp
```
<Tab>           補完候補の次に移動
<Shift><Tab>    補完候補の前に移動
q               補完候補を消す
<Enter>         補完候補の決定
```
## split
```
tx              画面下を分割しターミナルを開く
<Alt>k          上のwindowに移動
<Alt>j          下のwindowに移動
<Alt>h          左のwindowに移動
<Alt>l          右のwindowに移動
<Space>h		左のTabに移動
<Space>l		右のTabに移動
<Space>H		Tabを左に移動
<Space>L		Tabを右に移動
<Space>p		Tabをピン止め
<Space>j		Tabをユニークな英字で移動
```

## memo
```
<Space>m		Telescopeでメモのリストが起動
<Space>n		Telescopeでメモを検索
:MemoNew		新しいメモを作成
```

# Vim用語
* Buffer:			メモリに展開されたファイル
	* active:		表示された状態
	* hidden:		非表示だがメモリに読み込まれている
	* non-active:	非表示かつメモリに読み込まれていない
* Window:			バッファを表示する領域
* Tab:				Windowの集合(≒ OSのワークスペース)
