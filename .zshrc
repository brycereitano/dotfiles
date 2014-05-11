# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="terminalparty"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux common-aliases last-working-dir)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/home/zettazete/dev/go/bin:/home/zettazete/.config/bspwm:/home/zettazete/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="/home/zettazete/.gem/ruby/2.1.0/bin:$PATH"
export PATH="/home/zettazete/dev/lib/android-sdk-linux/tools:$PATH"
export PATH="/home/zettazete/dev/lib/android-sdk-linux/platform-tools:$PATH"
export GOPATH=~/dev/go
export DISABLE_AUTO_TITLE=true
export XDG_CONFIG_HOME="$HOME/.config"

# Preferred editor for local and remote sessions
export EDITOR='vim'

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle :compinstall filename '/home/zettazete/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt appendhistory autocd
unsetopt beep
# End of lines configured by zsh-newuser-install

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

export KEYTIMEOUT=1

alias sshvm="ssh -p 2020 archie@127.0.0.1"
alias alsa="alsamixer && sudo alsactl store"
alias rm="rm -f"
alias mux="tmux attach -t programming || tmux new -s programming"

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
archey
