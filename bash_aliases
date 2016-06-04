. .priv_bash_aliases

export PS1='\n┌─ $(if [[ $? == 0 ]]; then echo "\[\e[00;32m\][$?]"; else echo "\[\e[00;31m\][$?]"; fi)\[\e[0m\] [\t] [\[\e[00;94m\]\u\[\e[0m\]@\[\e[00;94m\]\h\[\e[0m\]] [\!] [\w]\n└─ '
function └─() { $@; }

export HISTTIMEFORMAT="%d/%m/%y %T "

alias aliases='vim ~/.bash_aliases'

alias py='python'
alias ptp='ptpython'
alias pti='ptipython'
eval $(thefuck --alias)

alias ff='nohup firefox &>/dev/null &'
lo() { nohup libreoffice "$@" &>/dev/null & }
ee() { nohup evince "$@" &>/dev/null & }

export EDITOR=vim
export JAVA_HOME=/usr/java
export PATH=~/bin:/usr/java/bin:$PATH

# INFO =====================
alias cpu='cat /proc/cpuinfo'
alias mem='cat /proc/meminfo'
# ==========================

# GIT =======================
source ~/.git-completion.bash
# ===========================

# DIRECTORIES AND FILES ====

# delete all "*.pyc" files ;)
alias delpyc='find . -name "*.pyc" -delete'

# jump back n directories at a time
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# show hidden files only
alias l.='ls -d .* --color=auto'

alias ll.='ls -Al'

# list all folders
alias lf='ls -Gl | grep ^d'
alias lsd='ls -Gal | grep ^d'

# make and cd into directory
function mcd() {
  mkdir -p "$1" && cd "$1";
}

# safe rm
alias rm='rm -I'
# ==========================


# TERMINAL =================
alias c='clear'

psgrep() {
    ps axuf | grep -v grep | grep "$@" -i --color=auto;
}

# show which commands you use the most
alias freq='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'
# ==========================


# UBUNTU UPGRADE ===========
alias upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get clean'
# ==========================


# USEFUL ALIAS FOR EXTRACT KNOW ARCHIVES
extract () {
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}
# ==========================


# OTHERS ============
# display weather :) (from icm)
alias wroclaw='display "http://www.meteo.pl/um/metco/mgram_pict.php?ntype=0u&row=436&col=181&lang=pl"'
# ===================
