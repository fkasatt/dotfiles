## Use powerline
#USE_POWERLINE="true"
## Source manjaro-zsh-configuration
#if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#  source /usr/share/zsh/manjaro-zsh-config
#fi
## Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi
autoload -U colors && colors
autoload -U compinit && compinit
setopt CORRECT
setopt EXTENDED_GLOB
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Custom prompt
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{green}(%s|%F{red}%a%F{green}|%F{magenta}%b%F{green}|%F{yellow}%u%F{green})%f '
zstyle ':vcs_info:*' formats ' %F{magenta}(%b%u)%f'
zstyle ':vcs_info:*' enable git
precmd() { vcs_info }
setopt PROMPT_SUBST

PROMPT='╭──── %(?,%F{white},%F{red}) %F{blue}%~%f ${vcs_info_msg_0_}
╰─%(?,%F{white}❯❯❯ ,%F{red}❯❯❯ )%f '

# History settings.
HISTFILE=~/.zsh_history # The file to save history to.
HISTSIZE=10000           # The maximum number of events to save in the internal history.
SAVEHIST=100000           # The maximum number of events to save in the history file.

# Better history searching
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward


# For i3wm users: command history search with dmenu
function dmenu_history {
    local line=$( ([ -n "$HISTFILE" ] && cat "$HISTFILE" || history -n 1) | dmenu -i -l 10 -p "History:" )
    if [[ -n "$line" ]]; then
        print -z "$line"
    fi
}
zle -N dmenu_history
bindkey '^R' dmenu_history

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

source ~/.zshenv
