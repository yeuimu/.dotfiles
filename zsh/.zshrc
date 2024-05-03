# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# alias
alias v="nvim"
alias vim="nvim"
alias vi="nvim"
alias c="cd"
alias b="cd .."
alias x="startx"
alias cls="clear"
alias e="emacs -nw"
alias sd="sudo"
alias soft="ssh soft"

# fcitx setting
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=xim
export QT_IM_MODULE=fcitx
export DefaultIMModule=fcitx

# system_proxy
export proxy="http://127.0.0.1:7890"
export http_proxy=$proxy
export https_proxy=$proxy
export ftp_proxy=$proxy
export no_proxy="localhost, 127.0.0.1, ::1"

# env 
export PATH=$PATH:~/.local/bin
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.cargo/bin/:$PATH"

# GDK & QT
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5
export GDK_BACKEND=x11
export QT_AUTO_SCREEN_SCALE_FACTOR=2
export QT_ENABLE_HIGHDPI_SCALING=0.5

# chinese => english
tse(){
  trans -b zh:en $1
}
# chinese => japanese
tsj(){
  trans -b zh:ja $1
}

set -o vi
