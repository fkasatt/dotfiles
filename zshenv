alias cls='clear'
alias vi='nvim'
alias ls='lsd'
alias la='lsd --all'
alias lt='lsd --all --tree'
alias ll='lsd --long'
alias lal='lsd --all --long'
alias ld='erd --long --human --level 2'
alias imp='import ~/pic/0aqwmdaf.png'
alias pin="ping google.com -c 1"
alias ytdl="~/bash/ytdl/ytdl.sh"
alias bl="xrandr --output HDMI-2 --brightness"
alias pacerr="sudo rm -rf /var/lib/pacman/sync"
alias rmforce="$HOME/script/rmforce.sh"
alias je="strans --repl -s ja -t en"
alias ej="strans --repl -s en -t ja"

export TEXTIMG_FONT_FILE=/usr/share/fonts/PlemolJPConsole_NF/PlemolJPConsoleNF-Text.ttf
export QT_QPA_PLATFORMTHEME="qt5ct"
export DENO_INSTALL="$HOME/.deno"
export PATH="/usr/bin:$PATH"
export EDITOR=/usr/bin/nvim
export editor=/usr/bin/nvim
export TERMINAL=/usr/bin/alacritty
export terminal=/usr/bin/alacritty
export VISUAL=/usr/bin/nvim
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export BROWSER=/usr/bin/vivaldi-stable
im=fcitx
export GTK_IM_MODULE=$im
export QT_IM_MODULE=$im
export XMODIFIERS=@im=$im
export INPUT_METHOD=$im
export SDL_IM_MODULE=$im

. "$HOME/.cargo/env"
