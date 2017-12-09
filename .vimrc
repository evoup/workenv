" Maintainer:   Odin <odinmanlee@gmail.com>
" Last change:  2008 Oct 29

"VIM help tips:
":help cmd    find normal mode command
":help i_cmd    find insert mode command
":help :cmd     find command-line command
":help  'option     find the option help
":set   option?     get the current value for the option

" Sections:
" ----------------------
" *> General
" *> Colors and Font
" *> Fileformat
" *> VIM userinterface
" ------ *> Statusline
" *> Visual
" *> Moving around and tab
" *> General Autocommand
" *> Parenthesis/bracket expanding
" *> General Abbrev
" *> Editing mappings etc.
" *> Command-line config
" *> Buffer realted
" *> Files and backup
" *> Folding
" *> Text option
" ------ *> Indent
" *> Spell checking
" *> Plugin configuration
" ------ *> Yank ring
" ------ *> File explorer
" ------ *> Minibuffer
" ------ *> Tag list (ctags) - not used
" ------ *> LaTeX Suite thing
" *> Filetype generic
" ------ *> Todo
" ------ *> VIM
" ------ *> HTML related
" ------ *> Ruby & PHP section
" ------ *> Python section
" ------ *> Cheetah section
" ------ *> Java section
" ------ *> JavaScript section
" ------ *> C mapping
" ------ *> SML
" ------ *> Scheme binding
" *> Snippet
" ------ *> Python
" ------ *> javaScript
" *> Cope
" *> MISC
"
" Tip:
" If you find anything that you can't understand than do this:
" help keyword OR helpgrep keyword
" Example:
" Go into command-line mode and type helpgrep nocompatible, ie.
" :helpgrep nocompatible
" then press <leader>c to see the results, or :botright cw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"OS value. return win32 UNIX or mac
function! MySys()
  return "UNIX"
endfunction

"Set shell to be tcsh
if MySys() == "UNIX" || MySys() == "mac"
  set shell=tcsh
endif

"Enable filetype plugin
if has("eval")
    filetype plugin indent on
endif

" default mapping
let mapleader=","               " Set mapleader
" let g:mapleader=","           " Set gui mapleader
nmap <leader>w :w!<cr>          " Fast Saving
map Q gq            " Don't use Ex mode, use Q for formatting

"set mouse=i                     " enable mouse(when Insert Mode)
set backupcopy=yes              "for crontab
set mousemodel=popup            " Use extend mouse mode to search word using SHIFT+left-mouse
set history=50                  " keep 50 lines of command line history
set viminfo='500                " Sets 500 lines of history VIM har to remember

" Switch syntax highlighting on, when the terminal has color
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
"  colors odin 
"colorscheme evening

  "internationalization
  "I only work in Win2k Chinese version
  "if has("multi_byte")
  "    let &termencoding = &encoding
  "    set encoding=utf-8
  "    " Set fileencoding priority
  "    if getfsize(expand("%")) > 0
  "        set fileencodings=utf-8,ucs-bom,cp936,big5,euc-jp,euc-kr,latin1
  "    else
  "        set fileencodings=cp936,big5,euc-jp,euc-kr,latin1
  "    endif
  "endif

  "if you use vim in tty,
  "'uxterm -cjk' or putty with option 'Treat CJK ambiguous characters as wide' on
  if has("ambiwidth")
      set ambiwidth=double
  endif

  if has("gui_running")
      set guioptions-=l

      colo darkblue

      if MySys()=="win32"
          "start gvim maximized
          if has("autocmd")
              au GUIEnter * simalt ~x
          endif
      endif
      if has("cursorline")
          set cursorline
          "hi cursorline guibg=#333333
          "hi CursorColumn guibg=#333333
      endif
  endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fileformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Favorite filetype
set fileformats=unix,dos

nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

let g:explHideFiles='^\.,\.com$,\.doc$,\.pdf$,\.dvi$,\.gz$,\.exe$,\.zip$ \.ps$,\.ppt$'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM userinterface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=7                 " Set 7 lines to the curors - when moving vertical..
set wildmenu                    " Turn on WiLd menu
set ruler                       " show the cursor position all the time
set cmdheight=1                 " The commandbar is 2 high
set lazyredraw                  " Do not redraw, when running macros.. lazyredraw
set hidden                      " Change buffer - without saving
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l          " Bbackspace and cursor keys wrap to
"set ignorecase                  " Ignore case when searching
set incsearch                   " do incremental searching
set hlsearch                    " highlight search content
set magic                       " set magic on
set noerrorbells                " no sounds on error
set visualbell                  " when error, flash as visual bell
set showmatch                   " show matching bracet
set matchtime=5                 " show matching time
set mat=3                      " How many tenths of a second to blink
set whichwrap=b,s,<,>,[,]
set formatoptions=tcrqmB
set splitbelow
set nostartofline
set showcmd                     " display incomplete command
set showmode                    " show editor mode, such as command, insert or replace, visual as messa
set confirm                     " with dialog support confirm({msg} [, {choices} [, {default} [, {type}]]])

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
"Always hide the statusline
set laststatus=2

function! CurDir()
    let curdir = substitute(getcwd(), '/home/odin/', "~/", "g")
    return curdir
endfunction

"Format the statusline
set statusline=
set statusline+=%f                              " path to the file in the buffer, relative to current directory
set statusline+=\ [%{strlen(&ft)?&ft:'none'},   " filetype
set statusline+=%{&encoding},                   " encoding
set statusline+=%{&fileformat}]                 " file format
set statusline+=\ (%l,%c)                       " 显示行数,列数
set statusline+=\ %r%{CurDir()}%h               " 显示当前目录
set statusline+=\ %h%1*%m%r%w%0*                " flag

""""""""""""""""""""""""""""""
" => Visual
""""""""""""""""""""""""""""""
" none

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around and tab page
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffer switch
nnoremap <silent> <F6> :bn<CR>
inoremap <silent> <F6> <ESC>:bn<CR>

"Tab configuration
map <leader>tn :tabnew %<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
if has("usetab")
    set switchbuf=usetab
endif
if has("stal")
    set showtabline=2
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Autocommand
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>cd :cd %:p:h<cr>          "Switch to current dir

"autocmd BufNewFile *.cpp 0r ~/.vim/skeleton/skeleton.cpp
"autocmd BufNewFile *.h 0r ~/.vim/skeleton/skeleton.h

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
")
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $w <esc>`>a"<esc>`<i"<esc>

"Map auto complete of (, ", ', [
"http://www.vim.org/tips/tip.php?tip_id=153
"
"ino ( ()<esc>:let leavechar=")"<cr>i
"ino { {}<esc>:let leavechar="}"<cr>i
"ino $q ''<esc>:let leavechar="'"<cr>i
"ino $w ""<esc>:let leavechar='"'<cr>i
"imap <c-l> <esc>:exec "normal f" . leavechar<cr>a


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab odate <c-r>=strftime("%Y%m%d%H%M")<cr>
iab owdate <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Move a line of text using control
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command-line config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"   (thanks Douglas Potts)
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/"<CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\\"<CR>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Buffer realted
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <c-q> :sb                       " Fast open a buffer by search for a name
map <leader>q :e ~/buffer<cr>       " Open a dummy buffer for paste
map <F9> ggVGg?                     " Buffer - reverse everything ... :)

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
augroup Posrem
  au!
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif
augroup END

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute "bdelete! ".l:currentBufNum
    endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files and backup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set backupdir=~/.vimbak         " Set backup dir
"set directory=~/.vimbak         " Set work dir
if has("win32")
  set backupdir=~/vimbak         " Set backup dir
  "set directory=~/vimbak         " Set work dir
  set directory=.,$TEMP
  set visualbell t_vb=  "关闭visual bell
  au GuiEnter * set t_vb= "关闭beep
else
  set backupdir=~/.vimbak         " Set backup dir
  set directory=~/.vimbak         " Set work dir
endif
if has("vms")
  set nobackup                  " do not keep a backup file, use versions instead
else
  set backup
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Enable folding, I find it very useful
set foldenable
set foldlevel=0
set foldmethod=marker

function! Fold()
 setl foldlevelstart=1
 syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
 syn match foldImports /\(\n\?import.\+;\n\)\+/ transparent fold

 "function! MyFoldText()
 "  "return substitute(getline(v:foldstart), '{.*', '{...}', '')
 "  return v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
 "endfunction
 "setl foldtext=MyFoldText()
 "set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\*\\\|\\*/\\\|{{{\\d\\=','','g')
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " 在输入 tab 后, vim 用恰当的空格来填充这个 tab.
set shiftwidth=4                " 设置自动缩进 4 个空格
set tabstop=4                   " 实际的 tab 即为 4 个空格, tabstop = 4 is better for c programming

map <leader>t2 :set shiftwidth=2<cr>
map <leader>t4 :set shiftwidth=4<cr>
au FileType xhtml,html,python,vim,javascript,sql setl shiftwidth=2    " (setl)仅对当前buffer生效
au FileType xhtml,html,python,vim,javascript,sql setl tabstop=2

""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""
set autoindent        "Auto indent
set smartindent       "Smart indet
set cindent           "C-style indenting
set cino=:0g0t0(sus   " values control how cindent indent code
set wrap              "Wrap line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  """"""""""""""""""""""""""""""
  " Vim Grep
  """"""""""""""""""""""""""""""
  let Grep_Skip_Dirs = 'RCS CVS SCCS .svn'
  let Grep_Cygwin_Find = 1

  """"""""""""""""""""""""""""""
  " Yank Ring
  """"""""""""""""""""""""""""""
  map <leader>y :YRShow<cr>

  """"""""""""""""""""""""""""""
  " File explorer
  """"""""""""""""""""""""""""""
  let g:explVertical=1            "Split vertically
  let g:explWinSize=35            "Window size
  let g:explSplitLeft=1
  let g:explSplitBelow=1
  let g:explHideFiles='^\.,.*\.class$,.*\.swp$,.*\.pyc$,.*\.swo$,\.DS_Store$'   "Hide some files
  let g:explDetailedHelp=0        "Hide the help thing..

  """"""""""""""""""""""""""""""
  " Minibuffer
  """"""""""""""""""""""""""""""
  "let g:miniBufExplModSelTarget = 1
  "let g:miniBufExplorerMoreThanOne = 2
  let g:miniBufExplUseSingleClick = 1
  "let g:miniBufExplMapWindowNavVim = 1
  "let g:miniBufExplVSplit = 25
  let g:miniBufExplSplitBelow=0
  "let g:bufExplorerSortBy = "name"
  "let g:miniBufExplMapWindowNavArrows = 1  "added by evoup 
  "let g:miniBufExplMapCTabSwitchBufs =1 "added by evoup 

  autocmd BufRead,BufNew :call UMiniBufExplorer
  map <S-D> <C-W>W<TAB><CR>
  map <S-C> :bNext<CR>

  """"""""""""""""""""""""""""""
  " Tag list (ctags) - not used
  """"""""""""""""""""""""""""""
  "let Tlist_Ctags_Cmd = "/sw/bin/ctags-exuberant"
  "let Tlist_Sort_Type = "name"
  "let Tlist_Show_Menu = 1
  "map <leader>t :Tlist<cr>

  """"""""""""""""""""""""""""""
  " LaTeX Suite things
  """"""""""""""""""""""""""""""
  set grepprg=grep\ -nH\ $*
  let g:Tex_DefaultTargetFormat="pdf"
  let g:Tex_ViewRule_pdf='xpdf'

  "Bindings
  autocmd FileType tex map <silent><leader><space> :w!<cr> :silent! call Tex_RunLaTeX()<cr>

  "Auto complete some things ;)
  autocmd FileType tex inoremap $i \indent
  autocmd FileType tex inoremap $* \cdot
  autocmd FileType tex inoremap $i \item
  autocmd FileType tex inoremap $m \[<cr>\]<esc>O


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype generic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  autocmd FileType text setlocal textwidth=78                   " For all text files set 'textwidth' to 78 characters.
  "au BufNewFile,BufRead *.todo so ~/vim_local/syntax/amido.vim  " todo

  """"""""""""""""""""""""""""""
  " HTML related
  """"""""""""""""""""""""""""""
  " HTML entities - used by xml edit plugin
  let xml_use_xhtml = 1
  "let xml_no_auto_nesting = 1

  "To HTML
  let html_use_css = 1
  let html_number_lines = 0
  let use_xhtml = 1

  """"""""""""""""""""""""""""""
  " nginx configuration
  """"""""""""""""""""""""""""""
  au BufRead,BufNewFile nginx.conf,madapi.conf,madserv.conf,rmserv.conf,smeserv.conf set ft=nginx

  """"""""""""""""""""""""""""""
  " Ruby & PHP section
  """"""""""""""""""""""""""""""
  autocmd BufNewFile,BufRead *.m   setl filetype=php       " .m is php
  autocmd BufNewFile *.m,*.php 0r ~/vim_setting/skeleton/skeleton.php
  autocmd FileType ruby map <buffer> <leader><space> :w!<cr>:!ruby %<cr>
  autocmd FileType php compiler php
  autocmd FileType php map <buffer> <leader><space> <leader>cd:w<cr>:make %<cr>
  au FileType php call Fold()
  "au FileType php setl fen





  """"""""""""""""""""""""""""""
  """"""""""""""""""""""""""""""



  """"""""""""""""""""""""""""""
  " Python section
  """"""""""""""""""""""""""""""
  "Run the current buffer in python - ie. on leader+space
  au FileType python so ~/vim_setting/syntax/python.vim
  autocmd FileType python map <buffer> <leader><space> :w!<cr>:!python %<cr>
  autocmd FileType python so ~/vim_setting/plugin/python_fold.vim

  "Set some bindings up for 'compile' of python
  autocmd FileType python set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
  autocmd FileType python set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

  "Python iMaps
  au FileType python set cindent
  au FileType python inoremap <buffer> $r return
  au FileType python inoremap <buffer> $s self
  au FileType python inoremap <buffer> $c ##<cr>#<space><cr>#<esc>kla
  au FileType python inoremap <buffer> $i import
  au FileType python inoremap <buffer> $p print
  au FileType python inoremap <buffer> $d """<cr>"""<esc>O

  "Run in the Python interpreter
  function! Python_Eval_VSplit() range
   let src = tempname()
   let dst = tempname()
   execute ": " . a:firstline . "," . a:lastline . "w " . src
   execute ":!python " . src . " > " . dst
   execute ":pedit! " . dst
  endfunction
  au FileType python vmap <F7> :call Python_Eval_VSplit()<cr>

  """"""""""""""""""""""""""""""
  " Cheetah section
  """""""""""""""""""""""""""""""
  autocmd FileType cheetah set ft=xml
  autocmd FileType cheetah set syntax=cheetah

  """""""""""""""""""""""""""""""
  " Vim section
  """""""""""""""""""""""""""""""
  autocmd FileType vim map <buffer> <leader><space> :w!<cr>:source %<cr>
  autocmd FileType vim set nofen

  """""""""""""""""""""""""""""""
  " Java section
  """""""""""""""""""""""""""""""
  au FileType java inoremap <buffer> <C-t> System.out.println();<esc>hi

  "Java comments
  autocmd FileType java source ~/vim_setting/macros/jcommenter.vim
  autocmd FileType java let b:jcommenter_class_author='Odin Lee (odin@madhouse-inc.com)'
  autocmd FileType java let b:jcommenter_file_author='Odin Lee (odin@madhouse-inc.com)'
  autocmd FileType java map <buffer> <F2> :call JCommentWriter()<cr>

  "Abbr'z
  autocmd FileType java inoremap <buffer> $pr private
  autocmd FileType java inoremap <buffer> $r return
  autocmd FileType java inoremap <buffer> $pu public
  autocmd FileType java inoremap <buffer> $i import
  autocmd FileType java inoremap <buffer> $b boolean
  autocmd FileType java inoremap <buffer> $v void
  autocmd FileType java inoremap <buffer> $s String

  au FileType java call Fold()
  "au FileType java setl fen

  au BufEnter *.sablecc,*.scc set ft=sablecc

  """"""""""""""""""""""""""""""
  " JavaScript section
  """""""""""""""""""""""""""""""
  au FileType javascript call Fold()
  "au FileType javascript setl fen

  au FileType javascript imap <c-t> console.log();<esc>hi
  au FileType javascript imap <c-a> alert();<esc>hi
  au FileType javascript setl nocindent
  au FileType javascript inoremap <buffer> $r return

  au FileType javascript inoremap <buffer> $d //<cr>//<cr>//<esc>ka<space>
  au FileType javascript inoremap <buffer> $c /**<cr><space><cr>**/<esc>ka

  """"""""""""""""""""""""""""""
  " HTML
  """""""""""""""""""""""""""""""
  au FileType html,cheetah set ft=xml
  au FileType html,cheetah set syntax=html

  """"""""""""""""""""""""""""""
  " C mappings
  """""""""""""""""""""""""""""""
  autocmd FileType c map <buffer> <leader><space> :w<cr>:!gcc %<cr>

  """""""""""""""""""""""""""""""
  " SML
  """""""""""""""""""""""""""""""
  autocmd FileType sml map <silent> <buffer> <leader><space> <leader>cd:w<cr>:!sml %<cr>

  """"""""""""""""""""""""""""""
  " Scheme bidings
  """"""""""""""""""""""""""""""
  autocmd BufNewFile,BufRead *.scm map <buffer> <leader><space> <leader>cd:w<cr>:!petite %<cr>
  autocmd BufNewFile,BufRead *.scm inoremap <buffer> <C-t> (pretty-print )<esc>i
  autocmd BufNewFile,BufRead *.scm vnoremap <C-t> <esc>`>a)<esc>`<i(pretty-print <esc>


  """"""""""""""""""""""""""""""
  " SVN section
  """""""""""""""""""""""""""""""
  map <F8> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

" Remove indenting on empty line
map <F2> :%s/\s*$//g<cr>:noh<cr>``

"folding command
map <F5> zR
map <F6> zO
map <F7> zc
map <F8> zM
map <F9> <C-a>

function TimeStamp()
  let curposn= SaveWinPosn()
  %s/\$Date: .*\$/\=strftime("$Date: %Y-%m-%d %H:%M:%S$")/ge
  %s/Last Change: .*$/\=strftime("Last Change: %Y-%m-%d %H:%M:%S")/ge
  %s/Last Modified: .*$/\=strftime("Last Modified: %Y-%m-%d %H:%M:%S")/ge
  %s/Last-Modified: .*$/\=strftime("Last-Modified: %Y-%m-%d %H:%M:%S")/ge
  call RestoreWinPosn(curposn)
endfunction


function AutoTimeStamp()
  augr tagdate
    au!
    au BufWritePre,FileWritePre * call TimeStamp()
  augr END
endfunction
" call AutoTimeStamp()

function NoAutoTimeStamp()
  augr tagdate
    au!
  augr END
endfunction

" my function
:function BreakPoint()
    :let gdbinit = $HOME . "/.gdbinit"
    :let setting = readfile(gdbinit)
    :let currentline = line(".")
    :let fname = bufname("%")
    :let breakcmd = printf("break   %s:%s", fname, currentline)
    :let newbreak = [breakcmd]
    :let setting += newbreak
    :let setting += [''] " add a new line at EOF
    :echo "break point : "
    :echo breakcmd
    :call writefile(setting, gdbinit)
:endfunction
map <F4>    <ESC>:call BreakPoint()<CR>

"personal mapping
map MM <F3>O/* {{{ <CR> */<CR>/* }}} */<ESC>kk$a



"added by evoup

"You can obtain the completion dictionary file from:
""  http://cvs.php.net/viewvc.cgi/phpdoc/funclist.txt
set dictionary-=$VIM/funclist.txt dictionary+=$VIM/funclist.txt

"Use the dictionary completion
set complete-=k complete+=k
"
"
"end added by evoup
set nocompatible    " Use Vim defaults (much better!)
set bs=2        " allow backspacing over everything in insert mode

set history=50        " keep 50 lines of command line history
set ruler        " show the cursor position all the time

if &term=="xterm"
set t_Co=8
set t_Sb=m
set t_Sf=m
endif

set tabstop=4
set shiftwidth=4

syntax on
set cindent
set incsearch
set foldmethod=marker
set foldopen&
set et

map <C-b> <Esc>\be

"color
"colorscheme evening

"You can obtain the completion dictionary file from:"
"http://cvs.php.net/viewvc.cgi/phpdoc/funclist.txt
set dictionary-=/etc/vim/funclist.txt dictionary+=/etc/vim/funclist.txt
"Use the
"dictionary completion
set complete-=k complete+=k

"Auto completion using the TAB key
"This function determines, wether we are on
"the start of the line text(then tab indents)
"or if we want to try auto completion
function! InsertTabWrapper()
let col=col('.')-1
if !col || getline('.')[col-1] !~ '\k'
return "\<TAB>"
else
return "\<C-N>"
endif
endfunction
"Remap the tab key to select action with InsertTabWrapper
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
filetype on
"filetype plugin indent on



"You can obtain the completion dictionary file from:
""  http://cvs.php.net/viewvc.cgi/phpdoc/funclist.txt
set dictionary-=$VIM/funclist.txt dictionary+=$VIM/funclist.txt

"Use the dictionary completion
set complete-=k complete+=k



"taglist
let Tlist_Ctags_Cmd = "/usr/local/bin/exctags"
let Tlist_Auto_Open=0
let Tlist_Use_SingleClick=1
let Tlist_Exit_OnlyWindow=1
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_Auto_Highlight_Tag=1
let Tlist_WinWidth=20
"map <silent> <leader>tl :TlistToogle<cr>
"source ~/vim_setting/plugin/taglist.vim
set nu


"vim颜色fix
if !has("gui_running")
    set t_Co=8
    set t_Sf=^[[3%p1%dm
    set t_Sb=^[[4%p1%dm
endif


set t_Co=256
"let t_Co=256
"set term=xterm-256color
"let term=xterm-256color
"colorscheme leo
"source ~/vim_setting/plugin/color_sample_pack.vim

set cul 
colorscheme zenburn
"colorscheme leo
"colorscheme zenburn
"colo leo
"colo molokai
"colo zenburn
set cursorline
hi cursorline guibg=#333333
hi CursorColumn guibg=#333333
hi ColorColumn ctermbg=120 guibg=#333333
"set colorcolumn=111
if exists('+colorcolumn')
    set colorcolumn=120
  else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
endif
" shift tab pages
map <S-A> :tabp<CR>
map <S-Z> :tabn<CR>
map <S-H> :!/usr/local/bin/php -l %<CR>
"注释的颜色
"hi Comment ctermfg=darkgreen
"hi String ctermfg=darkred
"hi Type ctermfg=yellow
"hi Number ctermfg=darkblue
"hi Constant ctermfg=blue
"hi Statement ctermfg=darkyellow
"source ~/.vim/plugin/echofunc.vim

"neocomplcache
let g:neocomplcache_enable_at_startup = 1 "和vjde不能共存 
hi CursorLine ctermbg=238 guibg=#262626 cterm=none


"Doxygen
map fg : Dox<cr>
let g:DoxygenToolkit_authorName="evoup evoex@126.com"
"let g:DoxygenToolkit_licenseTag="My own license\<enter>"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_undocTag="DOXIGEN_SKIP_BLOCK"
let g:DoxygenToolkit_briefTag_pre = "@brief "
let g:DoxygenToolkit_paramTag_pre = "@param "
let g:DoxygenToolkit_returnTag = "@return "
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_maxFunctionProtoLines = 30
let g:doxygen_enhanced_color=1
au BufRead,BufNewFile nginx.conf,madapi.conf,madserv.conf,rmserv.conf,smeserv.conf set ft=config
autocmd BufNewFile,Bufread *.ros,*.inc,*.php,*.m set keywordprg="help"

"echofunc插件在cli终端下需要的设置
"let g:EchoFuncKeyNext='<Esc>+'
"let g:EchoFuncKeyPrev='<Esc>-'
"
"show current function
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  echohl ModeMsg
  echo getline(search("^[^ \t#/]\\{2}.*[^:]\s*$", 'bW'))
  echohl None
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun
map f :call ShowFuncName() <CR>
set fdm=syntax
au BufRead,BufNewFile /var/log/messages map <S-X> :e<CR>

function! CompleteDetachedBracket()
  let line = line('.')
  let col = col('.')
  let c = getline(".")[col(".")]
  execute "normal \<RIGHT>%"
  if c == "$"
    execute "normal 2wi)"
  elseif line != line('.') || col != col('.')
    execute "normal a)"
  else
    execute "normal a)"
    startinsert
  endif
endfunction

" 括号自动完成 
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <c-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap < <><ESC>i
inoremap > <c-r>=ClosePair('>')<CR>
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf

"以下要整合到配色文件中
"show status line color in insert mode
" http://vim.wikia.com/wiki/Change_statusline_color_to_show_insert_or_normal_mode
" first, enable status line always
"set laststatus=2
" now set it up to change the status line based on mode
"if version >= 700
"  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"  au InsertLeave * hi StatusLine term=reverse ctermfg=7 ctermbg=2 gui=bold
"endif
"
"
"
""""""""""""""""""""""""""""""
" 笔记 configuration
""""""""""""""""""""""""""""""
"au BufRead,BufNewFile /usr/Selfservice/手册/笔记/newest.txt set ft=note
"重载文件
"au BufRead,BufNewFile /services/serving_log/monitor_debug.log map <S-X> :e<CR>


"折叠
"set foldmethod=manual 
set foldmethod=marker 

""""""""""""""""""""""""""""""
" 监控 configuration
""""""""""""""""""""""""""""""
"au BufRead,BufNewFile /services/serving_log/monitor_debug.log set ft=monitor_server


""""""""""""""""""""""""""""""
"  vim 状态栏显示最后编辑时间
""""""""""""""""""""""""""""""
"autocmd BufWrite * call SetStatusLine()
"autocmd BufRead * call SetStatusLine()
"function! SetStatusLine()
  "set statusline=[%n]\ %f\ %(\ \ (%M%R%H)%)\ \ \ %=\t%{ShowTab()}\ \ \ Modified:\ %{Time()}\ \ [%3l:%3L,%2c]\ %p%%\
  "set statusline=[%n]\ %f\ %(\ \ (%M%R%H)%)\ \ \ %=\t%{ShowTab()}\ \ \ Modified:\ %{Time()}\ \ [%3l:%3L,%2c]\ %p%%
"endfunction

"function! Time()
  "return strftime("%c", getftime(bufname("%")))
"endfunction

"function! ShowTab()
  "let TabLevel = (indent('.') / &ts )
  "if TabLevel == 0
    "let TabLevel='*'
  "endif
  "return TabLevel
"endfunction
:map td :tabnew .<cr>



syntax on
"一定要放到syntax on之后
hi ColorColumn ctermbg=70 guibg=#333333

"for git diff
"autocmd InsertLeave * if &diff == 1 | diffupdate | endif
"set diffopt+=context:8
"
"编译当前erlang文件且部署到rebar项目的rel目录的对应位置
"map bd :call CompileErlDeploy()<CR>
"func! CompileErlDeploy()
"  exec "w"
"  exec "!erlc -o /tmp % && set bar = \"`ls apps/`\" && mv /tmp/`basename %<.beam` rel/`ls apps/`/lib/`ls apps/`-`grep vsn apps/{$bar}/src/{$bar}.app.src | sed 's/{vsn, \"//g' | sed 's/\"},//g'`/ebin/ && `pwd`/rel/`ls apps/`/bin/`ls apps/` stop"
"endfunc

"map bf :call RunErl()<CR>
"func! RunErl()
"  exec "!`pwd`/rel/`ls apps/`/bin/`ls apps/` start"
"endfunct

"NERDTREE
let NERDTreeWinPos = "right"
let NERDTreeWinSize = 31
nmap <F9> <ESC>:NERDTreeToggle<RETURN>

"全天候解决乱码，无需vim file才不乱码，直接开vim就不乱码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"win32的乱码配置
if has("win32")
  set fileencoding=chinese

  "解决菜单乱码
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim

  "解决consle输出乱码
  language messages zh_CN.utf-8
  source ~\.vim\colors\zenburn.vim
  set guifont=Lucida_Console:h12:cANSI
else
  set fileencoding=utf-8
endif

"vjde
"let g:vjde_tab_cfu=1 
syntax on
hi Normal ctermbg=none
