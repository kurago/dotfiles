" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル(後述)を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


" setting
"文字コードをUFT-8に設定
set fenc=utf-8
"一行のマックス文字数
set synmaxcol=150
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 改行コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac 
" □や○文字が崩れる問題を解決
set ambiwidth=double 
"スクロールを5行手前で行う
set scrolloff=5
set backspace=2
set ttyscroll=1
set ttyfast
"set scrolljump=5

" 見た目系
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の行を強調表示(縦)
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" Vimの「%」を拡張する
source $VIMRUNTIME/macros/matchit.vim 
" コマンドモードの補完
set wildmenu 
" 保存するコマンド履歴の数
set history=300
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
"タイトルをウィンドウ枠に表示
set title

" Tab系
" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅(スペースいくつ分)
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=4
" 改行時に前の行のインデントを継続する 
set autoindent 
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent 

" 検索系
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch

"マウス設定
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"Fortran設定
let fortran_free_source=1
let fortran_fold=1
au! BufRead,BufNewFile *.f90 let b:fortran_do_enddo=1

"shortcut

syntax on
set t_Co=256
colorscheme onedark
set nowrap
set vb t_vb=
set timeout timeoutlen=50
"キーリマップ系
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <S-h> ^
nnoremap <S-l> $
vnoremap <S-h> ^
vnoremap <S-l> $
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
nnoremap <CR> A<CR><ESC>
nnoremap <F3> :noh<CR>
nnoremap <F4> :windo diffthis <CR>
nnoremap <F9> :cd %:h <CR>
nnoremap <F10> :!htop <CR>
nnoremap <F11> :!octave <CR>
nnoremap <F12> :!./do.sh <CR>

nnoremap <C-c> :!rm -f -v *.o *.vtk fdtd_vtk && make && ./fdtd_vtk <CR>
nnoremap <C-i> :!ifort -mcmodel=large -shared-intel -parallel % && time OMP_NUM_THREADS=

nnoremap ; :
xnoremap <expr> p 'pgv"'.v:register.'y`>'
nnoremap <silent><C-e> :NERDTreeToggle<CR>

nmap p <Plug>(yankround-p)
xmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
xmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
set backspace =indent,eol,start
set diffopt=filler,vertical
let g:winresizer_start_key= '<C-W>'
