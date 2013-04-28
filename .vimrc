set nocompatible          "不要兼容vi
filetype off              "必须的设置：

"Color Settings {
"set colorcolumn=85           "彩色显示第85行
set t_Co=256                 "设置256色显示
set background=dark          "使用color solarized
set cursorline               "设置光标高亮显示
"set cursorcolumn             "光标垂直高亮
set ttyfast
set ruler
set backspace=indent,eol,start
colorscheme solarized

let g:solarized_termtrans  = 1
let g:solarized_termcolors = 256
let g:solarized_contrast   = "high"
let g:solarized_visibility = "high"
"}

"tab setting {
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"}

set mouse=a
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set scrolloff=3
set fenc=utf-8
set autoindent
set hidden
"set encoding=utf-8

"set laststatus=2
set number                                    "显示行号
"set undofile                                  "无限undo
"set nowrap                                    "禁止自动换行
"autocmd! bufwritepost _vimrc source %         "自动载入配置文件不需要重启

"set relativenumber                             "相对行号 要想相对行号起作用要放在显示行号后面
set wrap                                       "自动换行
"set guifont=Inconsolata:h12                    "GUI界面里的字体，默认有抗锯齿
set guifont=Consolas:h12
set isk+=-                                     "将-连接符也设置为单词

set ignorecase "设置大小写敏感和聪明感知(小写全搜，大写完全匹配)
set smartcase
"set gdefault
set incsearch
set showmatch
set hlsearch

set numberwidth=4          "行号栏的宽度
"set columns=135           "初始窗口的宽度
"set lines=50              "初始窗口的高度
"winpos 620 45             "初始窗口的位置

set whichwrap=b,s,<,>,[,]  "让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）

"插入模式下移动
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-l> <right>
inoremap <c-h> <left>

"===================================================
"修改leader键为逗号
let mapleader=","

"使用tab键来代替%进行匹配跳转
nnoremap <tab> %
vnoremap <tab> %

"折叠html标签 ,fold tag
nnoremap <leader>ft vatzf
"使用,v来选择刚刚复制的段落，这样可以用来缩进
nnoremap <leader>v v`]

"使用,w来垂直分割窗口，这样可以同时查看多个文件,如果想水平分割则<c-w>s
"nnoremap <leader>w <c-w>v<c-w>l
nnoremap <leader>wc <c-w>c
nnoremap <leader>ww <c-w>w

"tab切换
nnoremap <leader>t gt
nnoremap <leader>r gT
"使用<leader>空格来取消搜索高亮
nnoremap <leader><space> :noh<cr>

"html中的js加注释 取消注释
nmap <leader>h I//jj
nmap <leader>ch ^xx
"切换到当前目录
nmap <leader>q :execute "cd" expand("%:h")<CR>

"取消粘贴缩进
nmap <leader>p :set paste<CR>
nmap <leader>pp :set nopaste<CR>

"文件类型切换
nmap <leader>fj :set ft=javascript<CR>
nmap <leader>fc :set ft=cpp<CR>
nmap <leader>fx :set ft=xml<CR>
nmap <leader>fm :set ft=mako<CR>

"设置隐藏gvim的菜单和工具栏 F2切换
set guioptions-=m
set guioptions-=T
"去除左右两边的滚动条
set go-=r
set go-=L

map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>


"Indent Guides设置
"let g:indent_guides_guide_size=1


"Vundle Settings {
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

Bundle 'ctrlp.vim'
Bundle 'AutoClose'
Bundle 'ZenCoding.vim'
Bundle 'matchit.zip'
Bundle 'Tabular'
Bundle 'syntasitc'
Bundle 'Valloric/YouCompleteMe'
"不让ycm每次查找.ycm_extra_conf.py文件"
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.vim/Bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'

Bundle 'spiiph/vim-space'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'trailing-whitespace'
Bundle 'taglist.vim'
Bundle 'ctags.vim'
let Tlist_Ctags_Cmd='ctags'
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=0
let Tlist_Auto_Open=1
let Tlist_WinWidth=23
let Tlist_Exit_OnlyWindow = 1


Bundle 'cscope.vim'
set tags +=~/.vim/systags
set tags +=~/.vim/stltags
set tags=./tags,./../tags,./**/tags
"ctags and cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
nmap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <leader>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <leader>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <leader>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>
nmap <leader>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
nmap <leader>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>
nmap <leader>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>
map <leader>l :call ToggleLocationList()<CR>

Bundle '_jsbeautify'
nnoremap <leader>_ff :call g:Jsbeautify()<CR>

Bundle 'EasyMotion'
let g:EasyMotion_leader_key = '<Leader><Leader>'

"Fencview的初始设置
"Bundle 'FencView.vim'
"let g:fencview_autodetect=1

Bundle 'The-NERD-tree'
"设置相对行号
nmap <leader>nt :NERDTree<cr>:set rnu<cr>
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeIgnore=['\.$','\~$']
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos='left'
let NERDTreeWinSize=23
let NERDTreeAutoOpen=1

Bundle 'The-NERD-Commenter'
let NERDShutUp=1
"支持单行和多行的选择，//格式
map <c-h> ,c<space>

Bundle 'UltiSnips'
"let g:UltiSnipsExpandTrigger="<c-j>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"}

"放置在Bundle的设置后，防止意外BUG
filetype plugin indent on
syntax on

func Make(cmd)
    let _makeprg = &makeprg
    let &makeprg = a:cmd
    make
    let &makeprg = _makeprg
endf
map <F2> :!date <CR>
map <F5> :w<CR>:call Make("g++ % -o%:r -O2 -Wall")<CR>
map <F6> :!./%:r<CR>
map <F7> :w<CR>:call Make("g++ % -o%:r -g -Wall")<CR>
map <F8> :!gdb ./%:r<CR>
map <F9> :!time ./%:r < in.txt<CR>
