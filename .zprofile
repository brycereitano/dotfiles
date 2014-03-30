export PATH="/home/zettazete/.config/bspwm/panel:/home/zettazete/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"
pulseaudio --start
[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
