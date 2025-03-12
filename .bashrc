#
# ~/.bashrc
#

export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
