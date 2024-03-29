set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  " Plugin 'L9'
  " Git plugin not hosted on GitHub
  Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  " Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Install L9 and avoid a Naming conflict if you've already installed a
  " different version somewhere else.
  " Plugin 'ascenator/L9', {'name': 'newL9'}

  " https://github.com/itchyny/lightline.vim
  Plugin 'itchyny/lightline.vim'

  " https://github.com/yuttie/inkstained-vim
  Plugin 'yuttie/inkstained-vim'

  " https://github.com/lervag/vimtex
  Plugin 'lervag/vimtex'

  " tabnine
  " Plugin 'zxqfl/tabnine-vim'

  " wakatime
  Plugin 'wakatime/vim-wakatime'

  " YouCompleteMe
  " https://github.com/ycm-core/YouCompleteMe
  Plugin 'Valloric/YouCompleteMe'

  " https://github.com/SirVer/ultisnips
  Plugin 'sirver/ultisnips'
  " All of your Plugins must be added before the following line

  " Supertab: use <c-n> subtitude tab
  Plugin 'ervandew/supertab'

  Plugin 'bronson/vim-trailing-whitespace'

  " https://github.com/davidhalter/jedi-vim
  Plugin 'davidhalter/jedi-vim'

  " https://github.com/Yggdroot/indentLine
  Plugin 'Yggdroot/indentLine'

  " https://github.com/preservim/nerdtree
  Plugin 'preservim/nerdtree'

  " highlights the selected words
  Plugin 'RRethy/vim-illuminate'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set shell=/bin/zsh

" setting line number
set number

" syntax
syntax on

" 在底部显示命令还是插入
set showmode

" 底部显示命令
set showcmd

" 使用鼠标, 关闭为r
set mouse=a

" 使用utf-8
set encoding=utf-8

" 开启文件类型检查, 载入对应类型的缩进规则
filetype indent on

" 自动缩进
set autoindent

" 设置tab宽度
set tabstop=2

" >>, <<, == 对应的缩进数
set shiftwidth=4

" tab变成空格
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 2 spaces
set expandtab

" 设置为相对行号
" set relativenumber

" 自动折行
set wrap

" 设置行宽
set textwidth=80

" 不会在单词内部折行
set linebreak

" 指定折行处与右边缘的位置
set wrapmargin=2

" 是否显示状态栏,0 不显示,1 多窗口显示, 2显示
set laststatus=2

" 状态栏显示光标位置
set ruler

" 括号匹配
set showmatch

" 高亮搜索结果
set hlsearch

" 搜索忽略大小写
" set ignorecase

" 对于只有一个大小写敏感
set smartcase

" 拼写检查
" set spell spelllang=en_us

" 保留撤销历史
set undofile
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

" 自动切换工作目录
set autochdir

" 错误时忽略主机声音
set noerrorbells

" 错误时屏幕闪烁
set visualbell

" 文件监视: 若使用中被别的编辑器编辑,弹出警告
set autoread

" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块。
set listchars=tab:»■,trail:■
set list

" 命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
set wildmenu
set wildmode=longest:list,full

" https://castel.dev/post/lecture-notes-1/#vim-and-latex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
" let g:tex_conceal='abdmg'
" The last two lines config­ure the con­ceal­ment.
" This is a feature where LaTeX code is re­placed or made
" in invisible when your cur­sor is not on that line.
" By making \[, \], $ invisible,
" they’re less ob­tru­sive which gives you a bet­ter overview of the document.
" This feature also re­places \bigcap by by ∩, \in by ∈ etc. The fol­low­ing an­i­ma­tion should make that clear.

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

if &diff
   colorscheme github
endif

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

imap jj <Esc>

" the setting of NERDTree
" https://github.com/preservim/nerdtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-\> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" implement system copy
" cnblogs.com/huahuayu/p/12235242.html1234
" zhihu.com/question/19863631
" if you run vim --version | grep clipboard
" is -clipboard,you need get get the extra features
" run
" sudo apt install vim-gtk
set clipboard^=unnamed,unnamedplus

" correct some spelling 修改错误拼写
iabbrev 收敛半径 收敛半径
iabbrev 皮亚渃 皮亚诺
iabbrev 甴此 由此
iabbrev 惼导数 偏导数
iabbrev （ (
iabbrev ） )

" save
nnoremap <C-s> :w<CR>
nnoremap so v/so<CR>k$

" insert single character
nnoremap <C-i> i0<Esc>r

" anki format
function AnkiFormat()
  %s/\\cite\[\(.*\)\].*/[\1]/ge
  %s/\\begin{solution}\[\(.*\)\].*/[\1]/ge
  %s/\$\(.\{-}\)\$/[$]\1[\/$]/ge
  %s/\\\[/[$$]/ge
  %s/\\\]/[\/$$]/ge
  %s/\(\\two{.*}\)/[latex]\1[\/latex]/ge
  %s/\(\\lstinline{.*}\)/[latex]\1[\/latex]/ge
  " %s/\(\\SI{.*}\)/[$]\1[\/$]/ge
  "%s/\(\\num{.*}\)/[$]\1[\/$]/ge
  %s/\\begin{align\*}/[latex]\\begin{align*}/ge
  %s/\\end{align\*}/\\end{align*}[\/latex]/ge
  %s/\\begin{lstlisting}/[latex]\\begin{lstlisting}/ge
  %s/\\end{lstlisting}/\\end{lstlisting}[\/latex]/ge
  %s/\\begin{table}\[H\]/[latex]\\begin{table}/ge
  %s/\\end{table}/\\end{table}[\/latex]/ge
  %s/\\id/\\text/ge
  %s/\\%/%/ge
  call feedkeys("ggvG<<")
endfunction
command AF call AnkiFormat()

" anki format
function Correct()
  %s/\\mathrm{d}/\\dif/ge
  %s/\\mathrm{\~d}/\\dif/ge
  %s/（/(/ge
  %s/）/)/ge
  %s/，/,/ge
  %s/。/./ge
  %s/？/?/ge
  %s/aligned/align*/ge
  %s/【/[/ge
  %s/】/]/ge
  %s/Ⅱ/II/ge
  %s/Ⅲ/III/ge
  %s/Ⅳ/IV/ge
  %s/Ⅰ/I/ge
  %s/；/;/ge
  %s/：/:/ge
  %s/Ⅴ/V/ge
  %s/①/(1)/ge
  %s/②/(2)/ge
  %s/③/(3)/ge
  %s/④/(4)/ge
  %s/⑤/(5)/ge
  %s/\\boldsymbol{\(.\{-}\)}/\1/ge
  %s/\\mathrm{\(.\{-}\)}/\1/ge
  %s/\\mathbf{\(.\{-}\)}/\1/ge
endfunction
command CR call Correct()


" indent
imap <c-]> <Esc>>>i
imap <s-tab> <Esc><<i
nmap <tab> i<tab><Esc>
"imap <c-[> <Esc><<i " Don't define it
"nmap <c-[> <<
"nmap <c-]> >>

" new line
nmap <CR> i<CR><Esc>

" add latex brace
nmap i[ i\[<Esc>
nmap i] i\]<Esc>

" add workplace vim config
if filereadable('config.vim')
  source config.vim
endif

" clear all
command Clear call feedkeys("gg999dd")

" latex si
function Si()
  %s/\(\d\+\)B/$\\SI{\1}{B}$/ge
  %s/\(\d\+\)\(.\)B/$\\SI{\1}{\2B}$/ge
endfunction
command SI call Si()
