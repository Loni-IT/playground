"バックスペースキーを有効にする
set backspace=indent,eol,start

"ルーラー、行番号を表示
set ruler
set number

"カーソルラインを表示
"set cursorline

"ファイルタイプに応じて挙動,色を変える
syntax on

"検索結果をハイライト
set hlsearch

"インクリメンタル検索
set incsearch

"変更中のファイルでも、保存しないで他のファイルを表示
set hidden

"OSとクリップボードを共有
set clipboard+=unnamedplus,unnamed

"検索をファイルの先頭へループしない
set nowrapscan

"折り返ししない
set nowrap

"エンコード設定
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8
"set fileformats=unix,dos,mac

"grepでcwindowを自動で開くようにする
au QuickfixCmdPost make,grep,grepadd,vimgrep copen

"TABなどの特殊文字を可視化する
set list
set listchars=tab:-\ ,trail:^

"全角スペースを強調表示
"highlight zenkakuda ctermbg=7
"call matchadd("zenkakuda", '\%u3000')

"全角スペースを強調表示"
"highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
"au BufRead,BufNew * match JpSpace /　/

"全角スペースを強調表示
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=reverse ctermfg=darkgrey gui=reverse guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    " ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
    autocmd ColorScheme       * call ZenkakuSpace()
    " 全角スペースのハイライト指定
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    autocmd VimEnter,WinEnter * match ZenkakuSpace '\%u3000'
  augroup END
  call ZenkakuSpace()
endif

"ステータスラインを常に表示
set laststatus=2

"ステータスラインにファイル名表示
set statusline+=%<%F\ 

"ステータスラインにファイルフォーマット表示
set statusline+=[%{&fileformat}]

"ステータスラインに文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]

"ここからバー右側
set statusline+=%=

"ステータスラインに文字バイト数/カラム番号
"set statusline+=[%{col('.')-1}=ASCII=%B,HEX=%c]

"ステータスラインに現在文字列/全体列表示
set statusline+=[C=%c/%{col('$')-1}]

"ステータスラインに現在行が全体行の何%目か表示
set statusline+=\ [%p%%]

"スワップファイルを作成しない
set noswapfile

"バックアップファイルを作成しない
set nobackup

" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu

"ノーマルモードのときにF2で前のバッファ、F3で次のバッファに移動
"map <silent>    <F2>    :bp<cr>
"map <silent>    <F3>    :bn<cr>

" 挿入モード終了時に IME 状態を保存しない
"inoremap <silent> <Esc> <Esc>
"inoremap <silent> <C-[> <Esc>
" 「日本語入力固定モード」切り替えキー
"inoremap <silent> <C-j> <C-^>

"[TeraTerm用] 挿入モードから抜けた時に IME をオフ、再度挿入モードに入った時に IME 状態を元に戻す
let &t_SI .= "\e[<r"
let &t_EI .= "\e[<s\e[<0t"
let &t_te .= "\e[<0t\e[<s"
set timeoutlen=100

"画面再描画時に検索の強調表示を無効化
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

