" Vim syntax file
" Language: debug.log

if exists("b:current_syntax")
  finish
end

setlocal iskeyword+=.
setlocal iskeyword+=/
setlocal iskeyword+=:

syn match Constant /注意/
syn match Constant /当心/
syn match Constant /小心/
syn match Debug /任务/
syn match Character /问题/
syn match Constant /总结/
syn match Constant /技巧/
syn match Constant /经验/
syn match Debug /caution/
syn match Error /mission/


