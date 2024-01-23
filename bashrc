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
alias ej='strans --repl -s en -t ja'
alias je='strans --repl -s ja -t en'
alias pin='ping -c 1 8.8.8.8'
alias icat='wezterm imgcat'
alias help='is --shell bash'
alias shark='display3d ~/Scripts/shark.rs/blahaj.obj --fps 20'
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

wttr (){
	curl -Lso- wttr.in/Izumo?lang=ja | sed 's/┤  \(.\) \(..\) \(..\)  ├/┤  \3\2日(\1)├/' | sed 's/┤  \(.\) \(..\) \(...\) ├/┤ \3\2日(\1)├/'
}

# eval "$(starship init bash)"
