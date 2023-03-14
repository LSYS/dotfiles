#==============================================================================
alias aliases="cat ~/.bash_aliases"
alias al=aliases
alias showal=aliases
alias sal=aliases
alias iforgot=aliases
alias edal="subl ~/doftfiles/bash/.bash_aliases"

alias aliashelp='echo    "=========================" \
								 && echo "Quick help for my aliases" \
								 && echo "=========================" \
								 && echo "aliases: Show all aliases in .bash_aliases" \
								 && echo "gital:   Show all Git aliases in .gitconfig" \
								 && echo "edal:  	 Edit .bash_aliases" \
                 && echo "ebrc:    Edit .bashrc (and then source afterwards)" \
                 && echo "ep:    	 Edit .profile (and then source afterwards)" \
                 && echo "clear:   Clear console" \
                 && echo "o:       Open file explorer here" \
                 && echo "mkcd:    mkdir and cd into it" \
                 && echo "cgr:     cd to root of Git repo" \
                 && echo "cgd:     cd to Windows mounted D drive" \
                 && echo "cdf:     cd to my dotfiles (src Git repo)"
                 '
alias ahelp=aliashelp


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
alias ebrc=nbrc


#==============================================================================
# Clear console
alias cl=clear
alias cls=cl


#==============================================================================
# Sublime Text
ST_SOURCE1="/mnt/d/Program Files/Sublime Text 3/sublime_text.exe"
ST_SOURCE2="/mnt/c/Program Files/Sublime Text/sublime_text.exe"

ST_SOURCE1_WITH_BACKSLASHES=$(echo "$ST_SOURCE1" | sed 's/ /\\ /g')
ST_SOURCE2_WITH_BACKSLASHES=$(echo "$ST_SOURCE2" | sed 's/ /\\ /g')

if [ -x "$ST_SOURCE1" ]; then
  alias sublimetext="$ST_SOURCE1_WITH_BACKSLASHES"
elif [ -x "$ST_SOURCE2" ]; then
  alias sublimetext="$ST_SOURCE2_WITH_BACKSLASHES"
else
  echo "Error: neither path exists."
fi

alias sublime=sublimetext
alias subl=sublimetext
alias st=sublimetext
alias sub=sublimetext


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
alias ep="nano ~/.profile && source ~/.profile"

# source bashrc
alias sbrc="source ~/.bashrc"

# quick cd to my source dotfiles
alias cddf="cd ~/dotfiles"
alias cdf=cddf


# Make directory and cd into it (see .functions)
alias mkcd=mkdircd
alias mcd=mkdircd

# quick cd to windows mounted drives
alias cdc="cd /mnt/c"
alias cdd="cd /mnt/d"

# touch a file and edit (see .functions)
alias te="touchedit"

# Open director (see .functions)
alias open="start"
alias o="start"


#==============================================================================
# Go up to root of a Git repository
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

alias gitaliases="git config --get-regexp '^alias\.' | sed 's/^alias\.//'"
alias gital=gitaliases
alias galias=gitaliases