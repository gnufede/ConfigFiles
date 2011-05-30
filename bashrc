#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source ~/.git-completion.sh

alias ls='ls --color=auto'

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]@\h\[\033[01;34m\] \W$(__git_ps1 "\[\033[01;32m\] <%s>")\[\033[00m\]\$ '
#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
