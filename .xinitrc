#                        _      _               _       _ _            
#  _   _ _ __ __ _ _   _| | ___( )___     __  _(_)_ __ (_) |_ _ __ ___ 
# | | | | '__/ _` | | | | |/ _ \// __|    \ \/ / | '_ \| | __| '__/ __|
# | |_| | | | (_| | |_| | |  __/ \__ \   _ >  <| | | | | | |_| | | (__ 
#  \__,_|_|  \__,_|\__, |_|\___| |___/  (_)_/\_\_|_| |_|_|\__|_|  \___|
#                  |___/                                               

# Hardware options
xset r rate 200 30
setxkbmap -option caps:escape
xinput disable "SynPS/2 Synaptics TouchPad"

# Display options
redshift -O 9150
xrdb ~/.Xresources
xwallpaper --zoom ~/pictures/wallpapers/cliff.jpg

# Keybindings
sxhkd &

while true; do
    xsetroot -name "   $(wifiprint)  |  $(batprint)  |    $(date +"%a, %B %d")  |    $(date +"%I:%M %p")  "
    sleep 10s
done &

sleep 0.1 # Extra time for bar to load properly

exec dwm
