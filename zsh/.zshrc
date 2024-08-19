# ------------ Zsh Setup ------------ #
set -o vi
autoload -Uz compinit
compinit

# ------------ Plugin Manager ------------ #

# Where should we download your Zsh plugins?
ZPLUGINDIR=$HOME/.local/share/zsh/plugins
ZTHEMEDIR=$HOME/.local/share/zsh/themes

# Downloader to clone plugin repo
function plugin-clone {
  local repo plugdir initfile initfiles=()
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
  for repo in $@; do
    plugdir=$ZPLUGINDIR/${repo:t}
    initfile=$plugdir/${repo:t}.plugin.zsh
    if [[ ! -d $plugdir ]]; then
      echo "Cloning $repo..."
      git clone -q --depth 1 --recursive --shallow-submodules https://github.com/$repo $plugdir
    fi
    if [[ ! -e $initfile ]]; then
      initfiles=($plugdir/*.{plugin.zsh,zsh-theme,zsh,sh}(N))
      (( $#initfiles )) && ln -sf $initfiles[1] $initfile
    fi
  done
}

# Plugin Loader
function plugin-load {
  local plugdir initfile
  ZPLUGINDIR=${ZPLUGINDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
  for plugdir in $@; do
    [[ $plugdir = /* ]] || plugdir=$ZPLUGINDIR/$plugdir
    fpath+=$plugdir
    initfile=$plugdir/${plugdir:t}.plugin.zsh
    (( $+functions[zsh-defer] )) && zsh-defer . $initfile || . $initfile
  done
}

# Theme Loader
function theme-load {
  local themedir themefile
  ZTHEMEDIR=${ZTHEMEDIR:-${ZDOTDIR:-$HOME/.config/zsh}/plugins}
  themedir=$ZTHEMEDIR/$1
  fpath+=$themedir
  themefile=$themedir.zsh-theme
  (( $+functions[zsh-defer] )) && zsh-defer . $themefile || . $themefile
}

# Github repo plugins list
repos=(
  # not-sourcable plugins
  romkatv/zsh-bench

  # projects with nested plugins
  belak/zsh-utils
  ohmyzsh/ohmyzsh

  # regular plugins
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search
  zdharma-continuum/fast-syntax-highlighting
)
plugin-clone $repos

# Handle non-standard plugins
export PATH="$ZPLUGINDIR/zsh-bench:$PATH"
for file in $ZPLUGINDIR/ohmyzsh/lib/*.zsh; do
  source $file
done

# Load plugins list
plugins=(
  zsh-utils/history
  zsh-utils/completion
  zsh-utils/utility
  ohmyzsh/plugins/magic-enter
  ohmyzsh/plugins/history-substring-search
  ohmyzsh/plugins/z
  fast-syntax-highlighting
  zsh-autosuggestions
)
plugin-load $plugins

# Load theme
# theme-load ohmyzsh/themes/robbyrussell
theme-load robbyrussell-ascii

# Plugin Compiler
function plugin-compile {
  ZPLUGINDIR=${ZPLUGINDIR:-$HOME/.config/zsh/plugins}
  autoload -U zrecompile
  local f
  for f in $ZPLUGINDIR/**/*.zsh{,-theme}(N); do
    zrecompile -pq "$f"
  done
}
