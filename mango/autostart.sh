# startup auth
killall polkit-kde-authentication-agent-1
/usr/lib/polkit-kde-authentication-agent-1 &

# start xdg desktop portal
/usr/lib/xdg-desktop-portal-wlr &

# bg: mpvpaper
# mpvpaper -o "no-audio loop panscan=1.0 hwdec=nvdec" '*' "$HOME/Videos/wallpapers/endfield-perly-moewalls.mp4" &

# bg: awww static:
killall awww-daemon
awww-daemon --namespace "$WAYLAND_DISPLAY" >$HOME/.config/tmp/awww-daemon.log 2>&1 &
sleep 1
awww img --namespace "$WAYLAND_DISPLAY" $HOME/Pictures/4knologo.png

# temp noctalia
killall noctalia
noctalia &

# colors
#gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
#gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
