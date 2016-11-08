SHELL=$(basename $(ps -h $$ | awk '{print $5}'))
case "$SHELL" in
    bash)
        ;;
    zsh)
        ;;
esac

screenfetch

PRIV_ALIASES="$HOME/.priv-aliases.sh"
[[ -f "$PRIV_ALIASES" ]] && . "$PRIV_ALIASES"

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh

alias aliases='vim ~/.aliases.sh'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias o='xdg-open'
alias py='python'
alias py3='python3'
alias ptp='ptpython'
alias pti='ptipython'
eval $(thefuck --alias)

export EDITOR=vim
export JAVA_HOME=/usr/java
export PATH=~/bin:/usr/java/bin:/usr/node/bin:$PATH
export GOPATH=~/programming/go

# INFO =====================
alias cpu='cat /proc/cpuinfo'
alias mem='cat /proc/meminfo'
# ==========================


# DIRECTORIES AND FILES ====

# delete all "*.pyc" files ;)
alias delpyc='find . -name "*.pyc" -delete'

# jump back n directories at a time
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias l='ls -CF'
# show hidden files only
alias l.='ls -d .* --color=auto'
alias ll.='ls -ld .* --color=auto'
alias lla='ls -Al'

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

# UBUNTU UPGRADE ===========
alias upgrade='sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get clean'
# ==========================


# USEFUL ALIAS FOR EXTRACT KNOW ARCHIVES
extract () {
    set -o xtrace
    if [ -f $1 ] ; then
      case $1 in
        *.tar.bz2)  tar xjf $1     ;;
        *.tar.gz)   tar xzf $1     ;;
        *.tar.xz)   tar xfJ $1     ;;
        *.bz2)      bunzip2 $1     ;;
        *.rar)      unrar e $1     ;;
        *.gz)       gunzip $1      ;;
        *.tar)      tar xf $1      ;;
        *.tbz2)     tar xjf $1     ;;
        *.tgz)      tar xzf $1     ;;
        *.zip)      unzip $1       ;;
        *.Z)        uncompress $1  ;;
        *.7z)       7z x $1        ;;
        *) echo "'$1' cannot be extracted via extract()" ;;
        esac
     else
         echo "'$1' is not a valid file"
     fi
    set +o xtrace
}
# ==========================


# OTHERS ============
# display weather :) (from icm)
alias wroclaw='display "http://www.meteo.pl/um/metco/mgram_pict.php?ntype=0u&row=436&col=181&lang=pl"'
# ===================
