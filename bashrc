#!/bin/bash

alias vi="nvim -p"
alias vim="nvim -p"

#m3
alias m3='cd ~/projects/m3'

#blx
alias blx='cd ~/projects/m3/blx'

#mixer
alias mixer='cd ~/projects/fort/modules/mixer'

#strats
alias strats='cd ~/projects/fort/modules/strats'

#bfl
alias bfl='cd ~/projects/fort/modules/bfl'

#bmx
alias bmx='cd ~/projects/fort/modules/bmx'

#bnb
alias bnb='cd ~/projects/fort/modules/bnb'

#bfx
alias bfx='cd ~/projects/fort/modules/bfx'

#lqd
alias lqd='cd ~/projects/fort/modules/lqd'

#okx
alias okx='cd ~/projects/fort/modules/okx'

#btse
alias btse='cd ~/projects/fort/modules/btse'

#huo
alias huo='cd ~/projects/fort/modules/huo'

#fort
alias fort='cd ~/projects/fort'

#cg
alias cg='cd ~/projects/cg'

#golang
export GOPATH=$HOME

#local packages
export PATH=~/bin:$PATH

GIT_PS1_SHOWCOLORHINTS=1

source ~/seanet/git-prompt.sh

if  [[ `whoami` =~ 'btc' ]]  
then

    PS1='\[\e[1;31m\][\u@\h \W]$(__git_ps1) $STY \$\[\e[0m\] '

elif  [[ `hostname` =~ 'grid' || `hostname` =~ 'wrk' ]] 
then

    PS1='\[\e[1;32m\][\u@\h \W]$(__git_ps1) $STY \$\[\e[0m\] '

elif [[ `hostname` =~ 'jst' ]]
then

    PS1='\[\e[1;31m\][\u@\h \W]$(__git_ps1) $STY \$\[\e[0m\] '

else

    PS1='\[\e[1;37m\][\u@\h \W]$(__git_ps1) $STY \$\[\e[0m\] '

fi

case "$-" in

    *i*) pushd > /dev/null .; cd ~/seanet; git pull > /dev/null; git status -s; popd > /dev/null

    esac

    alias rmake="make -C \`git rev-parse --show-toplevel\`"
    alias gitfclean='git submodule foreach git clean -xdf'
