alias aliases="cat ~/.bash_aliases"
alias al=aliases
alias showal=aliases
alias sal=aliases
alias iforgot=aliases


#==============================================================================
# Installs
alias sag="sudo apt-get"
alias sa="sudo apt"
alias sagu="sudo apt-get update"
alias sau="sudo apt update"
alias sagi="sudo apt-get install"
alias sai="sudo apt install"
alias sagr="sudo apt-get remove"


#==============================================================================
# Quick edits of config file(s)
alias nbrc="nano ~/.bashrc && source ~/.bashrc"


#==============================================================================
# Clear console
alias cl=clear
alias cls=cl


#==============================================================================
# Sublime Text
ST_SOURCE1="/mnt/d/Program\ Files/Sublime\ Text\ 3/sublime_text.exe"
ST_SOURCE2="/mnt/c/Program\ Files/Sublime\ Text/sublime_text.exe"

if test -f "$ST_SOURCE1"; then
	alias subl=$ST_SOURCE1
elif test -f "$ST_SOURCE2"; then
	alias subl=$ST_SOURCE2
fi

alias sublime=subl
alias sublimetext=subl
alias st=subl
alias sub=subl


#==============================================================================
# File explorer
alias start=wstart


#==============================================================================
# Replace notepad with notepads
alias notepad=notepads.exe


#==============================================================================
# VS Code
alias vscode=code


#==============================================================================
# EXA - extended ls
alias ls="exa \
	--all \
	--git \
	--git-ignore \
	--icons \
	--group-directories-first \
	--long \
	--header"

alias tree="exa \
	--tree \
	--level=2 \
	--long \
	--group-directories-first \
	--header \
	--git \
	--all \
	--ignore-glob .git
	"


#==============================================================================
# Rerun last command as root
alias rr='sudo $(history -p !!)'
alias please=rr
alias pls=rr


#==============================================================================
# bat/batcat (https://github.com/sharkdp/bat#how-to-use)
if type -p batcat >/dev/null 2>&1; then
	alias bat=batcat
fi
alias cat=bat


#==============================================================================
# Easier navigation
alias u="cd ..; "
alias uu="cd ../..;"
alias uuu="cd ../../..;"
alias uuuu="cd ../../../..;"
alias uuuuu="cd ../../../../..;"

# open ~/.profile for me (e.g. to change oh-my-posh theme)
alias np="nano ~/.profile"

# source bashrc
alias sbrc="source ~/.bashrc"

# quick cd to my source dotfiles
alias cddf="cd ~/dotfiles"
alias cdf=cddf


#==============================================================================
# Go up to root of a Git repository
function go-up-to-git-root {
  # > /dev/null 2>&1 discards both stdout and stderr of the git command 
  # to the null device (/dev/null)
  if ! git rev-parse --show-toplevel > /dev/null 2>&1; then
    echo "Error: Not inside a Git repository"
    return 1
  fi
  cd $(git rev-parse --show-toplevel)
}
alias gitroot='go-up-to-git-root'
alias gr=gitroot
alias cgr=gitroot
alias cdgr=gitroot


#==============================================================================
# Git stuff
alias ga='git add'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gd='git diff'
alias gf='git fetch'
alias gm='git merge'
alias gr='git rebase'
alias gp='git push'
alias gu='git unstage'
alias gco='git checkout'
alias gb='git branch'
