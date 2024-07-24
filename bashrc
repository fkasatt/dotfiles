[[ $- != *i* ]] && return
use_color=true
xhost +local:root > /dev/null 2>&1
shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

alias ls='lsd'
alias lt='lsd --tree'
alias la='lsd --all'
alias ll='lsd --long'
alias lal='lsd --all --long'
alias cls='clear'
alias where='readlink -f'
alias pin='ping -c 1 8.8.8.8'
alias help='is --shell bash'
alias shark='display3d ~/Scripts/shark.rs/blahaj.obj --fps 20'
alias icat='wezterm imgcat'
PS1='\[\e[36m\] \w\[\e[0m\]\n❯ '

clip (){
	clipman store
}

ckn (){
	cat > tmp
	cat tmp > $1
	rm tmp
}

zat (){
	zathura $1 &
}

rem (){
	if [ $# -ne 2 ] ; then
		echo "Usage: notify mm:dd message"
		exit 1
	fi
	echo notify-send -t 600000 $2 | at $1 > /dev/null 2>&1
}

hikaku (){
  rg -vxFf $2 $1
}
