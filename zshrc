# Path to your oh-my-zsh installation.
export OS_NAME=`uname -s`
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="terminalparty"

plugins=(adb aws bundler common-aliases docker git gitfast knife sudo tmux tmuxinator zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
export TERM="screen-256color"
export GOPATH="$HOME/dev/go"
export DISABLE_AUTO_TITLE=true
export DISABLE_SPRING=1

# Preferred editor for local and remote sessions
export EDITOR='vim'

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export EDITOR='vim'

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt appendhistory autocd
unsetopt beep
export KEYTIMEOUT=1

export ZSH_TMUX_AUTOSTART=true

alias alsa="alsamixer && sudo alsactl store"
alias rm="rm -f"
alias pmux="tmux attach -t programming || tmux new -s programming"

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias vim="echo -e '$(tput setaf 1)USE NVIM INSTEAD YOU IDIOT'"

generate_password () { cat /dev/urandom| tr -dc 'a-zA-Z0-9' | fold -w $1 | head -n $2 }

if [[ "$OS_NAME" == "Linux" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
  eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
  archey
fi
