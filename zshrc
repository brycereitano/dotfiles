# Path to your oh-my-zsh installation.
export OS_NAME=`uname -s`
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="terminalparty"

plugins=(git gitfast last-working-dir adb common-aliases)

source $ZSH/oh-my-zsh.sh

# User configuration
export TERM="screen-256color"
export GOPATH="$HOME/dev/go"
export DISABLE_AUTO_TITLE=true

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

alias alsa="alsamixer && sudo alsactl store"
alias rm="rm -f"
alias pmux="tmux attach -t programming || tmux new -s programming"

alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

if [[ "$OS_NAME" == "Linux" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config"
  eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
  archey
fi
