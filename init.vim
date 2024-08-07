call plug#begin('~/.config/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'benmills/vimux'
Plug 'danilo-augusto/vim-afterglow'
Plug 'dracula/vim'
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-syntastic/syntastic'
Plug 'sbdchd/neoformat'
Plug 'pangloss/vim-javascript'
Plug 'Chiel92/vim-autoformat'
Plug 'fladson/vim-kitty'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'MunifTanjim/nui.nvim'
"Plug 'jackMort/ChatGPT.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

"lua <<EOF
"-- chat gpt
"require("chatgpt").setup()
"EOF

map <silent> <C-n> :NERDTreeFocus<CR>

set encoding=utf-8

if (has("gui_running"))
        "set guifont=Source\ Code\ Pro:h11
        set guifont=Monaco:h13
        " 平滑字体
        set antialias
        " 设置配色方案
        "colorscheme dracula
        "colorscheme afterglow
        "colorscheme Tomorrow
        "colorscheme Tomorrow-Night
        "colorscheme base16-default-dark
        colorscheme base16-tomorrow-night
        " 不显示滚动条
        set guioptions-=r
else
        " 平滑字体
        "set antialias
        " 设置配色方案
        "colorscheme dracula
        colorscheme afterglow
        "colorscheme Tomorrow
        "colorscheme Tomorrow-Night
        "colorscheme base16-default-dark
        "colorscheme base16-tomorrow-night

endif
" nerdcommenter configuration
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" alternative delimiter
let g:NERDAltDelims_c = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Add your own custom formats or override the defaults
"let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1


" ctrlp
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <leader>f :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" remap colon to space
" nmap <space> <Leader>
" vmap <space> <Leader>

" remap leader from \ to ;
"let mapleader=";"

nnoremap <leader>h :helpgrep<space>

" select a jump in the jump list
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"
    endif
  endif
endfunction
" use :call GotoJump() or simply use <Leader>j
" type 4 for the 4th jump, type +4 to forward to the 4th jump
nmap <Leader>j :call GotoJump()<CR>

" use Ctrl+L to clear search highlight
if maparg('<C-L>', 'n') ==# '' | nnoremap <silent> <C-L> :nohlsearch<CR><C-L> | endif

" dictionary using ici
" python package ici and ydcv should be installed first
nmap <Leader>y :!echo --==Lookup <C-R><C-w> from iciba and YouDao...==-- ; ydcv <C-R><C-W>; ici <C-R><C-W><CR>

" taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" 设置帮助文档为中文，需要 vimcdoc 子模块的支持
set helplang=cn

" for powerline status bar
set rtp+=~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
" 启动显示状态行(1)，总是显示状态行(2)
set laststatus=2
set t_Co=256

" taglist
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" 选中状态下 Ctrl+c 复制
vmap <C-c> "+y

" 使用 vi 非兼容模式
set nocompatible

" 设置命令行行高，默认是 1
set cmdheight=2

" 显示当前指令
set showcmd

" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-

" 命令/文件名自动补全
set wildmenu
set wildmode=longest:full,full

filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on

" 语法高亮
syntax on

" 高亮显示普通txt文件（需要txt.vim脚本）
"au BufRead,BufNewFile * setfiletype txt

"set backspace=2

" iTerm2 上会有使用 delete 键无法删除的情况，加上这个就没问题了
" 这个问题只在 iTerm2 上会出现，使用 vimR 就没有问题。
set backspace=indent,eol,start

" 设置光标随鼠标移动
set mouse=a
" 选择时不包含当前光标所在字符
set selection=exclusive
"set selectmode=mouse,key



" 可视模式下 Ctrl+c 复制
vmap <C-c> "*y
" 普通模式下 Ctrl+y 粘贴
map <C-y> "*p

" 删除行末空白符
"nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"nnoremap <F8> :let _s=@/<Bar>:%s/;\s\+$/;/e<Bar>:let @/=_s<Bar><CR>
" better way
" use :call TrimWhitespace()
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun
" define a command to simplify the call
" just use :TrimWhitespace
command! TrimWhitespace call TrimWhitespace()
" or even simpler, use \+w
noremap <Leader>w :call TrimWhitespace()<CR>

" 共享剪贴板
set clipboard+=unnamed
" 显示行号
set number
" 搜索忽略大小写
set ignorecase
" 高亮显示匹配的括号
set showmatch
" 设置键入闭合括号后，反向高亮开始括号后返回闭合括号的延迟时间，以十分之一秒为单位。
set matchtime=5
" 搜索跟随输入逐个字符高亮
set hlsearch
set incsearch

set whichwrap+=<,>,[,]

" 自动折行
set wrap

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）
set scrolloff=5

" 设置当文件被改动时自动载入
set autoread

" 在处理未保存或只读文件的时候，弹出确认
set confirm

"set copyindent
set autoindent
set cindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
" 用空格代替制表符
set expandtab
" 在行和段的开始处使用制表符
set smarttab
" 为 C 程序提供自动缩进
set smartindent

" 在被分割的窗口间添加空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\

" 如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
set listchars=tab:»■,trail:■
set list

" 1 line yanked, 2 lines deleted message displayed
set report=0

" 自动切换工作目录
set autochdir

" 突出显示当前行
set cursorline

" 不生成临时文件
set noswapfile

" 历史记录数
set history=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
function! SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1,"\#########################################################################")
		call append(line("."), "\# File Name: ".expand("%"))
		call append(line(".")+1, "\# Author: Michael Wu")
		call append(line(".")+2, "\# mail: mapleaph@gmail.com")
		call append(line(".")+3, "\# Created Time: ".strftime("%c"))
		call append(line(".")+4, "\#########################################################################")
		call append(line(".")+5, "\#!/bin/sh")
		call append(line(".")+6, "")
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author: Michael Wu")
		call append(line(".")+2, "	> Mail: mapleaph@gmail.com ")
		call append(line(".")+3, "	> Created Time: ".strftime("%c"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "")
	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunction

" NerdTree
" 打开/关闭 NERDTree 快捷键
map <leader>t :NERDTreeToggle<CR>
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=31
" 在终端启动 vim 时，共享 NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
" 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '\.DS_Store']
" 显示书签列表
let NERDTreeShowBookmarks=1

" 显示 git 信息
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" syntastic recommanded settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

command! Hex %!xxd
command! Hexq %!xxd -r

" start marked2.app to preview markdown file
" use :call TrimWhitespace()
function! Marked2()
    !open % -a "Marked 2"
endfunction

" matchit
packadd! matchit

" move current line up/down by line(s)
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>

" insert empty line(s)
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" change cursor shape in different modes
if empty($TMUX)
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
  let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif

" prevent lose selection when using < >
xnoremap <  <gv
xnoremap >  >gv

" highlight current line only in the current window
" and disable highlight when in insert mode.
autocmd InsertLeave,WinEnter * set cursorline
autocmd InsertEnter,WinLeave * set nocursorline

" make auto-complete even faster
set complete-=i   " disable scanning included files
set complete-=t   " disable searching tags

" enable complete
set omnifunc=syntaxcomplete#Complete

" cscope keybindings
" currently conflict with nerdcommenter
"nnoremap <buffer> <leader>cs :cscope find s  <c-r>=expand('<cword>')<cr><cr>
"nnoremap <buffer> <leader>cg :cscope find g  <c-r>=expand('<cword>')<cr><cr>
"nnoremap <buffer> <leader>cc :cscope find c  <c-r>=expand('<cword>')<cr><cr>
"nnoremap <buffer> <leader>ct :cscope find t  <c-r>=expand('<cword>')<cr><cr>
"nnoremap <buffer> <leader>ce :cscope find e  <c-r>=expand('<cword>')<cr><cr>
"nnoremap <buffer> <leader>cf :cscope find f  <c-r>=expand('<cfile>')<cr><cr>
"nnoremap <buffer> <leader>ci :cscope find i ^<c-r>=expand('<cfile>')<cr>$<cr>
"nnoremap <buffer> <leader>cd :cscope find d  <c-r>=expand('<cword>')<cr><cr>



" file encoding
let &termencoding=&encoding
set fileencodings=utf-8,gbk

" coc
" 太长的更新间隔会导致明显的延迟并降低使用者体验（预设是 4000 ms = 4s ）
set updatetime=300

" 永远显示 signcolumn（行号左边那个，这我不知道怎麽翻），否则每当有诊断出来时整个程序码就会被往右移
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " 新的版本可以把 signcolumn 和行号合并（这个我版本不够没看过，有人知道会长怎样可以下面留言吗？）
  set signcolumn=number
else
  set signcolumn=yes
endif
" 用 tab 键触发自动补全
" 注意：载入设定後记得用命令 `verbose imap <tab>` 确定这没有被其他外挂覆盖掉
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 让 enter 键自动完成第一个建议并让 coc 进行格式化（不确定个格式化指的是什麽，我看不太出来）
" enter 可以被重复 keymap（看不懂就算了，意思是你乱搞不会出错）
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 用 \rn 重新命名变数、函数（原文写「符号」）
nmap <leader>rn <Plug>(coc-rename)

" 这个让你可以卷动浮动视窗和跳出式框框（有时候自动补全给你的文件会太长超出萤幕，如果你想要看下面的内容必须设定这个）
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

