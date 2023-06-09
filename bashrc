[[ $- != *i* ]] && return

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

use_color=true

safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

unset use_color safe_term match_lhs sh

xhost +local:root > /dev/null 2>&1

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s histappend

ckn (){
	cat > tmp
	cat tmp > $1
	rm tmp
}

push (){
	git diff origin/HEAD | rg '^\+' | rg 'auth|api_key|pass|token|secret' 2> /dev/null
	if [ $? -eq 1 ] ; then
		git push
	fi
}

source $HOME/.profile
