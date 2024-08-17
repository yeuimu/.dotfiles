LOCALSHAREDIR="$HOME/.local/share"
CONFIGDIR="$HOME/.config"
DOTFILESDIR="$HOME/.dotfiles"

# links["destination"]="from"
declare -A links
links[$CONFIGDIR/bspwm]="$DOTFILESDIR/bspwm"
links[$CONFIGDIR/sxhkd]="$DOTFILESDIR/sxhkd"
links[$CONFIGDIR/rofi]="$DOTFILESDIR/rofi"
links[$CONFIGDIR/kitty]="$DOTFILESDIR/kitty"
links[$CONFIGDIR/feh]="$DOTFILESDIR/feh"
links[$CONFIGDIR/polybar]="$DOTFILESDIR/polybar"
links[$CONFIGDIR/picom]="$DOTFILESDIR/picom"
links[$CONFIGDIR/nvim]="$DOTFILESDIR/nvim"
links[$CONFIGDIR/mpd]="$DOTFILESDIR/mpd"
links[$CONFIGDIR/fontconfig]="$DOTFILESDIR/fontconfig"
links[$HOME/.xinitrc]="$DOTFILESDIR/x/.xinitrc"
links[$HOME/.Xmodmap]="$DOTFILESDIR/x/.Xmodmap"
links[$HOME/.tmux.conf]="$DOTFILESDIR/tmux/.tmux.conf"
links[$HOME/.emacs.d]="$DOTFILESDIR/.emacs.d"
links[$HOME/.zshrc]="$DOTFILESDIR/zsh/.zshrc"
links[$HOME/.asoundrc]="$DOTFILESDIR/.asoundrc"
links[$LOCALSHAREDIR/zsh/themes]="$DOTFILESDIR/zsh/themes"

unlink() {
  local destination=$1
  rm -rf $destination
  echo -e "\e[32mDelete: \e[O" "\e[37m$1\e[O"
}

link() {
  local from destination
  for destination in ${(@k)links[@]}; do
    echo $destination
    from=${links[$destination]}

    # delete origin link
    unlink $destination
  
    # mkdir path
    [ ! -d $(dirname $destination) ] && \
      mkdir -p $(dirname $destination) && \
  		echo -e "\e[32mMake: \e[O" "\e[37m"  "$(dirname ${destination})" "\e[O"
  
    # link
    [ ! -e $destination ] && \
      ln -s $from $destination && \
      echo -e "\e[32mLink: \e[O" "\e[37m" "$from" "=>" "$destination" "\e[O"

  done
}

uninstall() {
  local from destination
  for destination in "${(k)links[@]}"; do
    unlink $destination
  done
}

clone_dotfiles() {
  [ ! -d $DOTFILESDIR ] && git clone https://github.com/yeuimu/.dotfiles $DOTFILESDIR
}

# Install all config, 1 version
install() {
  clone_dotfiles
  link
}
