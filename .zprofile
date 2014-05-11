export PATH="/home/zettazete/dev/go/bin:/home/zettazete/.config/bspwm:/home/zettazete/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"
pulseaudio --start
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
