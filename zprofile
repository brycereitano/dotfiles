export OS_NAME=`uname -s`
export PATH="/usr/local/go/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="$HOME/dev/go/bin:$HOME/bin:$HOME/.rbenv/bin:/usr/sbin:$PATH"
eval "$(rbenv init -)"

if [[ "$OS_NAME" == "Linux" ]]; then
  export PATH="$HOME/.config/bspwm:$PATH"
  pulseaudio --start
  [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi
