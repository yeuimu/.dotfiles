uninstall() {
  local file = $1
 	if [[ -e $file || -L $file ]];then
		echo -e "\e[32mDelete: \e[O" "\e[37m$1\e[O"
		rm -rf $file
	fi 
}
