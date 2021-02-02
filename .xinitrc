xrdb -merge ~/.Xresources
git/self/dwm/dwmstatus.sh &
xss-lock slock &

nm-applet &
QT_FONT_DPI=70 ./.dropbox-dist/dropboxd &

brave-browser &
QT_FONT_DPI=70 keepassxc &
run_keybase &
steam &
discord &
~/bin/Telegram &
urxvt -T cereza -e bash -i -c "mosh cereza" &

~/git/self/dwm/dwm.sh
