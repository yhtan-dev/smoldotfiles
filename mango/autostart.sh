# startup auth
#killall polkit-kde-authentication-agent-1
#/usr/lib/polkit-kde-authentication-agent-1 &

# start xdg desktop portal
/usr/lib/xdg-desktop-portal-wlr &
/usr/lib/pam_kwallet_init &

# temp noctalia
noctalia &
