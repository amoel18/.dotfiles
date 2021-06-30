pacmd set-card-profile 0 output:analog-stereo
pacmd set-card-profile 0 output:analog-surround-40


test-speaker


pulseaudio -nC

pacmd list-sinks|egrep -i 'index:|name:'
pacmd --help
pacmd list-cards
aplay -L

pax11publish -d

"pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket" 
