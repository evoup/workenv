" Vim color file
" Maintainer:	Odin Lee <odinman@gmail.com>
" Last Change:	2008 Oct 28
" grey on black
" optimized for TFT panels

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
"colorscheme default
let g:colors_name = "odin"

"""""""""""""""""""""""""""""""""
" VIM
"""""""""""""""""""""""""""""""""
hi TabLine    cterm=NONE ctermfg=LightGrey ctermbg=DarkGrey  gui=NONE guifg=Red guibg=white
hi TabLineSel cterm=NONE ctermfg=Cyan  gui=NONE guifg=Red guibg=white
hi TabLineFill  cterm=NONE  ctermbg=DarkGrey  gui=NONE  guibg=white
"vim状态行
hi StatusLine cterm=NONE ctermfg=LightGrey ctermbg=DarkGrey  gui=NONE guifg=Red guibg=white

"""""""""""""""""""""""""""""""""""""""""""""
"syntax
"""""""""""""""""""""""""""""""""""""""""""""
"hi Normal     ctermfg=LightGrey	ctermbg=Black
"普通内容

"搜索到内容
"hi Search     cterm=NONE ctermfg=Black	ctermbg=Red gui=NONE guifg=Black guibg=Red

"在visual模式时
hi Visual     cterm=reverse   gui=reverse

hi Cursor     cterm=bold ctermfg=Black ctermbg=Green  gui=bold guifg=Black guibg=Green

"括号等
hi Special    cterm=NONE ctermfg=DarkMagenta  gui=NONE guifg=DarkMagenta

"注释
hi Comment    cterm=NONE ctermfg=DarkGray     gui=NONE guifg=DarkGray

"if,else等
hi Statement  cterm=NONE ctermfg=Brown  gui=NONE guifg=Brown 

"引号内容
hi Constant   cterm=NONE ctermfg=LightGreen gui=NONE guifg=LightGreen
"hi Constant   cterm=NONE ctermfg=DarkCyan   gui=NONE guifg=DarkCyan

"变量名颜色
hi Identifier cterm=NONE ctermfg=DarkCyan   gui=NONE guifg=DarkCyan
"hi Identifier cterm=NONE ctermfg=LightGreen gui=NONE guifg=LightGreen

"include,require等
hi PreProc    cterm=NONE ctermfg=DarkRed    gui=NONE guifg=Red2

"folding
hi Folded     cterm=NONE  ctermfg=blue ctermbg=NONE gui=NONE guibg=grey30 guifg=gold
hi FoldColumn cterm=NONE  ctermfg=blue ctermbg=NONE gui=NONE guibg=grey30 guifg=tan
