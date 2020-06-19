setxkbmap -option caps:escape
xinput disable "SynPS/2 Synaptics TouchPad"
xset r rate 200 30
xwallpaper --zoom ~/pictures/wallpapers/cliff.jpg

redshift -O 9150
sxhkd &

while true; do
    xsetroot -name "   $(wifiprint)  |  $(batprint)  |    $(date +"%a, %B %d")  |    $(date +"%I:%M %p")  "
    sleep 10s
done &

sleep 0.1

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

exec dwm
