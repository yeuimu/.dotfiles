curent_dir=$(pwd)
home_dir=$(echo ~)

# target_file_path source_file_path
install_file(){
  local destination from
  destination=$1
  from=$2

	if [[ -e $destination || -L $destination ]];then
		echo -e "\e[32mDelete: \e[O" "\e[37m$1\e[O"
		rm -rf $destination
	fi

  if [[ ! -e ${destination%/*} ]];then
    mkdir ${destination%/*}
  fi

	echo -e "\e[32mLink: \e[O" "\e[37m" "$from" "=>" "$destination" "\e[O"
	ln -s $from $destination
}

# target_path source_path
install_dir(){
	if [[ -e $1 || -L $1 ]];then
		echo -e "\e[32mDelete: \e[O" "\e[37m$1\e[O"
		rm -rf $1
	fi

	if ! [ -e $(dirname $1) ];then
		echo -e "\e[32mMake: \e[O" "\e[37m"  "$(dirname $1)" "\e[O"
		mkdir -p $(dirname $1)
	fi

	echo -e "\e[32mLink: \e[O" "\e[37m" "$2" "=>" "$1" "\e[O"
	ln -s $2 $1
}

# target source
install(){
	 if [ -d $2 ];then
	 	install_dir $1 $2
	 else
	 	install_file $1 $2
	 fi
  #install_file $1 $2
}

# bspwm
install $home_dir/.config/bspwm $curent_dir/bspwm
install $home_dir/.config/sxhkd $curent_dir/sxhkd
install $home_dir/.config/rofi $curent_dir/rofi
install $home_dir/.config/kitty $curent_dir/kitty
install $home_dir/.config/feh $curent_dir/feh
install $home_dir/.config/polybar $curent_dir/polybar
install $home_dir/.config/picom $curent_dir/picom

# neovim
install $home_dir/.config/nvim $curent_dir/nvim

# emacs
install $home_dir/.emacs.d $curent_dir/.emacs.d

# zsh
install $home_dir/.zshrc $curent_dir/zsh/.zshrc
install $home_dir/".local"/share/zsh/themes/robbyrussell-ascii.zsh-theme $curent_dir/zsh/robbyrussell-ascii.zsh-theme

# x
install $home_dir/.xinitrc $curent_dir/x/.xinitrc
install $home_dir/.Xmodmap $curent_dir/x/.Xmodemap

# tmux
install $home_dir/.tmux.conf $curent_dir/tmux/.tmux.conf

# font config
install $home_dir/.config/fontconfig $curent_dir/fontconfig

# sound
install $home_dir/.asoundrc $curent_dir/.asoundrc

# mpd
# install $home_dir/.config/mpd $curent_dir/mpd
