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
	--header \
	--git
	"


#==============================================================================
# Clear console
alias cl=clear
alias cls=cl


#==============================================================================
# Installs
alias sag="sudo apt-get"
alias sagi="sudo apt-get install"
alias sagr="sudo apt-get remove"

# Run last command as root
alias rr='sudo $(history -p !!)'
alias please=rr
alias pls=rr