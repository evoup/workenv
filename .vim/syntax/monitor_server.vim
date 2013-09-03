" Vim syntax file
" Language: debug.log

if exists("b:current_syntax")
  finish
end

setlocal iskeyword+=.
setlocal iskeyword+=/
setlocal iskeyword+=:
syn match tag /\[jscli\]/
syn match Comment /\[jsc\]/
syn match Delimiter /\[jsa\]/
syn match Conditional /\[jss\]/
syn match tag /\[mjsrclick\]/
syn match Comment /\[mjsc\]/
syn match Delimiter /\[mjsa\]/
syn match Conditional /\[mjss\]/
syn match Error /\[sid\ authentication\ expired!\]/
syn match Conditional /\[sid\ authenticated!\]/
syn match Conditional /\[uid\ matched\ with\ clickurl!\]/
syn match Conditional /\[getcacheinfo\ ok!\]/
syn match Conditional /\[saveLog\]/
syn match Conditional /save\ uid\ ok!/
syn match Conditional /setcookie\ ok!/
syn match Error /\[fcap:2\]-\[result:2\]/
syn match Error /\[jsNow\ is\ not\ valid!\]/
syn match Comment /ServInfo/
"不要在调试信息里出现sid
syn match Error /stag_base/
syn match Constant /build_cookie_id:/
syn match Constant /\[final_camp_id:.*uid:\d.*/
syn match Keyword /app_camp_detail_appurltype/
syn match Conditional /app_platform/
syn match Error /error!not\ web\ js\ adposition/
syn match Error /provinceismatch/
syn match Boolean /key_a_cn_ab/
syn match Boolean /country_code/
syn match Boolean /ipInfo/
syn match Conditional /key_b/
syn match Conditional /key_a/
syn match Conditional /ua_width/
syn match Conditional /fun.getUaSize/
syn match Error /need_ua/
syn match Keyword /logIp/
syn match Boolean /uid/ 
syn match Boolean /webUa:/
syn match Boolean /origUa:/
syn match Boolean /ua:/
syn match Boolean /ua_crc/
syn match Debug /img_url:/
syn match Macro /jsrclick/
syn match Macro /index:/
syn match Conditional /after_authentication/
syn match Error /pre\ check\ NotLog\ failed!/
syn match Conditional /pre\ check\ NotLog\ ok!/
syn match Error /ua_dismatch/
syn match Conditional /serv_name/
syn match Conditional /serv_list/
syn match Conditional /removed/
syn match Error /failed\ to\ get\ memcache/
syn match Error /fail/
set nohlsearch

"这样就不能用折叠
setl readonly nomodifiable
colo molokai

""自动重载
"set autoread

""http://vim.1045645.n5.nabble.com/set-autoread-doesn-t-seem-to-work-td1174093.html
"function! Tailf() 
  "checktime | normal G 
  "let K_IGNORE = "\x80\xFD\x35"   " internal key code that is ignored 
  "call feedkeys(K_IGNORE) 
"endfunction 
"augroup tailf 
  "au! 
  "au CursorHold,CursorHoldI * :call Tailf() 
"augroup END 


