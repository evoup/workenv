# $FreeBSD: src/share/skel/dot.cshrc,v 1.13 2001/01/10 17:35:28 archie Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 9500
alias j		jobs -l
alias la	ls -la
alias lf	ls -FA
alias ll	ls -lA

# A righteous umask
umask 2

#set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/bin)

setenv	EDITOR	vim
setenv	PAGER	more
setenv	BLOCKSIZE	K
##Chinese support
setenv  LANG    zh_CN.UTF-8
setenv  LC_ALL  zh_CN.UTF-8
#setenv  LANG zh_CN.GB2312
#setenv  LC_ALL zh_CN.GB2312

if ($?prompt) then
	# An interactive shell -- set some stuff up
	set filec
	set history = 1000
	set savehist = 500
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey "^b" backward-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
	endif
endif

##odin's setting
setenv LSCOLORS ExGxFxdxCxegedabagExEx
setenv CLICOLOR yes
#set prompt = '%B[%n@%m %c]%#%b'
set prompt = "%B%{\033[34m%}[%{\033[36m%}%n%{\033[34m%}@%{\033[33m%}%m %{\033[32m%}%c%{\033[34m%}]%{\033[35m%}%#%b"
set autolist
##after install vim
alias vi        vim
setenv ss "cd /services/Users/yin/selfservice"
setenv m "cd /services/Users/yin/selfservice/protected/modules/selfservice/models"
setenv v "cd /services/Users/yin/selfservice/protected/modules/selfservice/views"
setenv c "cd /services/Users/yin/selfservice/protected/modules/selfservice/controllers"
setenv lang "cd /services/Users/yin/selfservice/protected/messages/zh_cn"
setenv mss "cd /services/Users/yin/selfservice/protected/modules/selfservice/"
setenv site "cd /services/Users/yin/selfservice/"
setenv ssm "cd /services/Users/yin/selfservice/protected/modules/selfservice/models"
setenv ssv "cd /services/Users/yin/selfservice/protected/modules/selfservice/views"
setenv ssc "cd /services/Users/yin/selfservice/protected/modules/selfservice/controllers"
setenv getsvn "svn co svn://172.16.27.97/selfservice/trunk/code"
setenv getsvn2 "cp -r  code/* ./"
setenv getsvn3 "ln -s ../pm ./"
setenv getsvn4 "chmod 777 /services/Users/yin/selfservice/protected/runtime"
setenv getsvn5 "chmod 777 /services/Users/yin/selfservice/assets"
setenv getengine "svn co svn://172.16.27.97/serving/engines/madhouse6/trunk/selfservice"
setenv getfront "svn co svn://172.16.27.97/serving/engines/appAd2"
setenv getread "svn co svn://172.16.27.97/serving/engines/serv_daemons/trunk/code/deliver"
setenv getnginmad "svn co svn://172.16.27.97/serving/engines/nginmad"
setenv getmatch "svn co svn://172.16.27.97/serving/ad_matching/trunk/selfservice"
setenv getmh6match "svn co svn://172.16.27.97/serving/ad_matching/trunk/code"
setenv get139 "svn co svn://172.16.27.97/madhouse6/branches/139"
setenv getappad2 "svn co svn://172.16.27.97/serving/engines/appAd2/trunkRichMedia"
setenv scr "screen -r" 
setenv mad "cd /services/Users/yin/madhouse6"
#cursor="blink"
alias jsengine "cd /services/Users/yin/jsengine/selfservice"
alias jsmatch "cd /services/Users/yin/ss_match/selfservice_dev"
#alias vim "sudo vim"
alias nginx6restart "sudo /services/nginx_rd/sbin/nginx -s reload"
alias cp "cp"
setenv createCtags_php "find . -name '*.php' -exec exctags --language-force=php {} +"
setenv createCtags_m "find . -name '*.m' -exec exctags --language-force=php {} +"
alias x "exit"
alias debuglog "tail /services/serving_log/debug.log"
alias debuglog2 "less /services/serving_log/debug.log"
alias nginxconf "cd /services/nginx_serv/conf"
alias .. "cd .."
alias ... "cd ../../"
alias jsengineconf "cd /services/serving/2009"
alias f "find . \( -path '*.svn*' -o -path '*.fcgi*' -o -path '*tags*' -o -name '*.o' -o -name '*.so' -o -name '*.a' \) -prune -o -name .git -prune -o -print | xargs grep -in --color"
alias sf "svn diff"
alias sslog "tail -f /services/nginx_rd/logs/ad2dev_engine.log"
#alias rm "sudo rm"
alias mh6_jsengine "cd /services/Users/yin/madhouse6_jsengine/code"
alias engine_conf "cd /services/serving/2009"
alias psx "sudo ps -o user,pid,ppid,command -ax | grep "
alias monitorserver "cd /usr/home/yin/project/management/monitor_server"
alias monitorserver2 "cd /usr/home/yin/project/management/monitor_server2"
alias php "/usr/local/php5_admin/bin/php"
alias clearvim "sudo mv ~/.vimbak/* /tmp"
alias vim "/usr/local/bin/vim"
alias mmsapi "cd /usr/home/yin/project/mmsapi/maas_debug"
alias gpom "git push origin master"
alias gr "git reset --hard"
alias gs "git status"
alias ga "git diff -a"
alias gf "git diff"
alias sd "svn diff"
alias st "svn st"
alias gca "git commit -a"
alias gi "git rev-list HEAD | wc -l | awk '{print $1}'"
alias gl "git log"
#alias gv "git revert HEAD^1"
alias tf "tail -f"
alias p1 'vim -c "source ~/vimsession/monitorserver2.vim"'
alias p2 'vim -c "source ~/vimsession/mms.vim"'
alias p3 'vim -c "source ~/vimsession/erl.vim"'
alias c 'clear'
alias 老子要解压 "tar xzf "
alias pps "ps x -o ppid,pid,command"
setenv JAVA_HOME "/usr/local/diablo-jdk1.6.0/"
setenv JAVA_BIN "/usr/local/bin/"
alias monitorui "cd /usr/home/yin/project/monitorui/client"
alias mip "cd /usr/home/yin/project/madhouse_ip/madhouseIp"
alias indiamip "cd /usr/home/yin/project/indiaMadhouseIp"
alias mdnapi "cd /usr/home/yin/project/mdn_receiver/mdnapi_alpha"
alias mdnapi_client "cd /usr/home/yin/project/mdn_receiver/mdnapi_alpha/test"

#for hipop
setenv HPHP_HOME /services/hiphop-php
setenv HPHP_LIB ${HPHP_HOME}/bin
setenv CMAKE_PREFIX_PATH /services/hipop-php-include
#setenv CC "ccache /usr/local/bin/gcc44"
#setenv CXX "ccache /usr/local/bin/g++44"
setenv CC "/usr/local/bin/gcc44"
setenv CXX "/usr/local/bin/g++44"
setenv MAKEOPTS ' -j3 '
set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin /usr/X11R6/bin $HOME/sbin /services/hiphop-php/src/hphp /services/hiphop-php/src/hphpi /usr/local/go/bin)
alias mdnsrc "cd /services/serv/data/hiphop/mdndeliverapi"
alias autoconf "/usr/home/yin/local/bin/autoconf/bin/autoconf"

setenv PHP_AUTOCONF "/usr/bin/autoconf"
setenv PHP_AUTOHEADER "/usr/bin/autoheader"
alias rrdtool /usr/lib64/rrdtool/bin/rrdtool
#alias go "/usr/local/go/bin/go"
setenv GOROOT "/usr/local/go"
setenv GOPATH "/usr/home/yin/project/management/golib:/usr/home/yin/project/management/madmonitor2/go"
#setenv PATH=$PATH:$GOROOT/bin

alias monsrvd "cd /usr/home/evoup/project/management/monsrvd-2.1"
#mina include
setenv CLASSPATH "/usr/home/yin/project/management/monsrvd-2.2/monsrvd-2.1/test/mongo-2.10.1.jar:/usr/home/yin/project/management/monsrvd-2.2/monsrvd-2.1/test/slf4j-log4j12-1.7.2.jar:/usr/home/yin/project/management/monsrvd-2.2/monsrvd-2.1/test/log4j-1.2.8.jar:/usr/home/evoup/project/management/monsrvd-2.2/monsrvd-2.1/test/slf4j-api-1.7.2.jar:/usr/home/evoup/project/management/monsrvd-2.2/monsrvd-2.1/test/slf4j-nop-1.7.2.jar:/usr/home/evoup/project/management/monsrvd-2.2/monsrvd-2.1/test/mina-core-2.0.7.jar:/usr/local/diablo-jdk1.6.0/lib:."

setenv ANT_HOME "/usr/home/yin/project/management/javalib/apache-ant-1.8.4"
setenv M2_HOME "/usr/home/yin/project/management/javalib/apache-maven"
setenv MAVEN_OPTS "-Xms128m -Xmx512m"
set path=( $path $M2_HOME/bin $ANT_HOME/bin $GOROOT/bin)
