export QT_QPA_PLATFORMTHEME="qt5ct"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
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
