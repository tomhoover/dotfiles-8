#!/not/executable/bash

# enable pip's caching by default:
export PIP_DOWNLOAD_CACHE="$HOME"'/.pip/cache'
export PIP_FIND_LINKS='file://'"$HOME"'/.pip/cache'

alias tmux-env='eval `~/bin/tmux-env`'
alias crterm='export TERM=xterm-256color; source ~/.bashrc'
function ssh-dev() {
	ssh -R 4444:localhost:4444 -ttA dev34-devc.dev.yelpcorp.com TMPDIR=/nail/tmp tmux attach $(test -z "$1" || echo -t) "$1"
}
function reset() {
    ## http://askubuntu.com/a/123296/23034
    tput rmcup
    command reset
}

alias login='source ~/.bashrc'

# enable color support of ls and also add handy aliases
if [ -x $(which dircolors) ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -re '\''s/^\s*[0-9]+\s*//;s/[;&|]+\s*alert$//'\'')"'

# http://superuser.com/a/599156/50425
function title {
    echo -ne "\033]0;"$*"\007"
}
