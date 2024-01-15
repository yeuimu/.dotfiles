#! /bin/bash

curent_dir=$(pwd)
home_dir=$(echo ~)

# target_file_path source_file_path
install_file(){
	if [[ -e $1 || -L $1 ]];then
		echo -e "\e[32mDelete: \e[O" "\e[37m$1\e[O"
		rm -rf $1
	fi

	echo -e "\e[32mLink: \e[O" "\e[37m" "$2" "=>" "$1" "\e[O"
	ln -s $2 $1
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
}

# bspwm
install $home_dir/.config/bspwm $curent_dir/bspwm
install $home_dir/.config/sxhkd $curent_dir/sxhkd
install $home_dir/.config/rofi $curent_dir/rofi
install $home_dir/.config/alacritty $curent_dir/alacritty
install $home_dir/.config/feh $curent_dir/feh
install $home_dir/.config/polybar $curent_dir/polybar

# neovim
install $home_dir/.config/nvim $curent_dir/nvim

# emacs
install $home_dir/.emacs.d $curent_dir/.emacs.d

# zsh
install $home_dir/.zshrc $curent_dir/zsh/.zshrc

# x
install $home_dir/.xinitrc $curent_dir/x/.xinitrc

# tmux
install $home_dir/.tmux.conf $curent_dir/tmux/.tmux.conf
