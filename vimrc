set nocompatible    "去掉讨厌的有关vi一致性模式,避免以前版本的一些bug和局限
set backspace=indent,eol,start
syntax on
set nu!
set hls
"set (no)et        "是否讲输入TAB自动展开成空格
"set softtabstop=4 "方便在启用et后使用退格键,每次退格讲删除X个空格
set tabstop=4   "设置tab键为4个空格
set shiftwidth=4    "设置当行之间交错使用时使用4个空格
set mouse=a     "鼠标可操作
filetype on     "检测文件的类型
"set ai!         "设置自动缩进autoindent
"set showmatch   "设置匹配模式,类似当输入一个左括号时会匹配相应的右括号 
set ruler       "在编辑过程中,在右下角显示光标的状态行
set scrolloff=5     " 光标移动到buffer的顶部和底部时保持3行距离 
filetype plugin on	"全能补全
filetype indent on  "为特定文件类型载入相关缩进文i件
"set cursorline    "or set cul 设置光标所在的行
"set cursorcolumn	"set cuc 设置光标所在列
set foldenable      " 允许折叠
set foldmethod=manual   " 手动折叠 
"set spell			"激活拼写字典的自动补全
"set completeopt=preview	"取消补全时的预览
set matchtime=1        	"匹配括号高亮的时间
"----F12自动编译加执行
autocmd FileType c,cpp :map <silent> <F12> :call Compile_for_glut()<cr>
function! Compile_for_glut()
	exec "w"
	exec "!g++ -Wall -g '%' -lm -lGL -lGLU -lglut -o '%:t:r'"
	exec "!./'%:t:r'"
endfunction
autocmd FileType c,cpp :map <silent> <F5> :call Compile_for_c_cpp()<cr>
function! Compile_for_c_cpp()
	exec "w"
	exec "!g++ -o '%:t:r' '%'"
	exec "!./'%:t:r'"
endfunction

"-----<F5>自动编译java文件
autocmd FileType java :map <silent> <F5> :call Compile_for_java()<cr>
function! Compile_for_java()
	exec "w"
	exec "!javac %"
	exec "!java %<"
endfunction

"多种类型编译
"map <F5> :call CompileRunGc()<CR>
"imap <F5> :call CompileRunGc()<CR>
function!CompileRunGc()
	exec "w"
	exec "cd %:p:h"
	if &filetype =='sh'
		:!./%
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!java %<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "! ./%<"
	endif
endfunc

hi Pmenu ctermfg=black ctermbg=gray  guibg=#444444
hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o	"取消换行自动添加注释符 
"手动添加字典
set dict-=~/.dict.txt dict+=~/.dict.txt
set laststatus=2 "初始值wei2

" 设置状态栏格式
"set statusline=%<%F%=%y%m%r%h%w%{&ff}\[%{&fenc}]0x%02B@%040h#%n\(%3l/%3L,%3c\|%3v\)%3p%%
set statusline=%1*\%<%.50F\             "显示文件名和文件路径
set statusline+=%=%2*\%y%m%r%h%w\ %*        "显示文件类型及文件状态
set statusline+=%3*\%{&ff}\[%{&fenc}]\ %*   "显示文件编码类型
set statusline+=%4*\ row:%l/%L,col:%c\ %*   "显示光标所在行和列
set statusline+=%5*\%3p%%\%*            "显示光标前文本所占总文本的比例
hi User1 cterm=none ctermfg=white ctermbg=0
hi User2 cterm=none ctermfg=208 ctermbg=0
hi User3 cterm=none ctermfg=169 ctermbg=0
hi User4 cterm=none ctermfg=100 ctermbg=0
hi User5 cterm=none ctermfg=green ctermbg=0

"添加保存

"括号等的自动完成
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap {<CR> {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap ' ''<ESC>i
:inoremap " ""<ESC>i
function! ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
     return "\<Right>"
 else
     return a:char
 endif
endfunction

"打开文件，光标回到上次编辑的位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"java自动补全
"setlocal omnifunc=javacomplete#Complete
