#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Eval's
eval "$(zoxide init bash)" # zoxide

# fuzzy finder
[ -f /usr/share/fzf/key-bindings.bash ] && source /usr/share/fzf/key-bindings.bash
[ -f /usr/share/fzf/completion.bash ] && source /usr/share/fzf/completion.bash

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias TODO='nvim ~/.TODO.md'
alias cl='clear ; l'
alias fucking=sudo
alias l='lsd -l'
alias la='ls -alh'
alias ll='ls -lh'
alias lla='ls -alh'
alias ls=eza
alias sl=ls

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Prompt
PS1='\[\e[1;35m\]╔═◇◆ \[\e[1;32m\]だにへく\[\e[1;35m\]◆◇ ═╗\n\[\e[1;36m\]║ \[\e[1;33m\]\u\[\e[1;36m\]＠\h \[ \e[1;36m\]║\n\[\e[1;33m\]╚═◇◆━━━━━━━━━━━━━┛ \[\e[1;36m\]\w \[\e[0m\] \[\e[91m\]$(parse_git_branch)\[\e[00m\]\n ❯ '
PS1='\[\e[1;33m\]だにへく \[\e[1;36m\]| \[\e[1;32m\]\h \[\e[1;33m\]➜ \[\e[1;36m\]\w \[\e[0m\]'

# Colors
source ~/.cache/hellwal/variables.sh
sh ~/.cache/hellwal/terminal.sh

# External scripts
PATH="$PATH:/$HOME/.scripts"
export PATH="/home/danihek/.local/bin:$PATH"

