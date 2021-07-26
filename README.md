Adding dotfiles to a new system:

nv in terminal to edit READ.me

1) git clone --separate-git-dir=$HOME/.dots https://github.com/amoel18/.dotfiles.git tmpdotfiles

2) rsync --recursive --verbose --exclude '.git' tmpdotfiles/ $HOME/

3) rm -r tmpdotfiles



matlab -nodisplay -nosplash -nodesktop -r "run('em');exit;" | tail -n +11 #launch m file "



#applications
wf-recorder     #record desktop
silentcast      #gif maker
qrcodegen       #generate qrcode


nmap q #insert letter without leaving normal mode

mod+z=cat REAME.md
mod+r=edit README.md
mod+q=cat shortcuts

mod+a=latex session
mod+s=school session
mod+d=python session
mod+e=edit file


n = zsh function append line to REAdME




#nvim
leader+"=surrond word with "

$+"=surround visual selection with "


if the wrong tmux config run the command: tmux source-file .tmux.conf


if you want to change default application you have to edit /usr/share/applications/mimeinfo.cache


jdownloader2      #Download manager, written in Java, for one-click hosting sites like Rapidshare and Megaupload. Uses its own updater.


postman-bin       #api test build document

wlogout           #lougout menu
mod+b             #mail
mod+n             #browse school files
mod+c             #cd
mod+w             #window browsr
mod+return        #browser
mod+o             #run application
https://www.bankcheckingsavings.com/bitcoin-and-cryptocurrency-bonuses/
nået
https://etoro.tw/3dJde1P
pei referral: o2zlay
https://github.com/fmfn/BayesianOptimization
getpei
bondora invest 10euro 5 bonus (https://p2pinvesting.eu/p2p-bonus-offers/)
brickstarter
getpei.com
debituum.network invest 250euro+
HeavyFinance # not yet signed up.
Kviku Finance invest 100euro+ for 20euro
neofinance +10euro any amount # not yet signed
nordstreet +15euro for 100  invested amount # not yet signed
Rendity # not signed up
Twino# not signed up
Viainvest #not signed
binance 10%commision
celsius network network 30dollar in btc

#zathura :
c to copy link
^o ^i Move backward and forward through jump list (use after following link)


penge i: etoro, binance, crypterium, coinbase, celcius $40. # blockcard TERN
wdisplays


2021-04-23
2021-04-23-3710$
2021-04-23-3828$
ethminer -G -P stratum://.0xef982699a7e03f8adbc666f88f85a6349833fce7.worker1@slushpool.com:9999/alllllllllllllklllllllllllllm%40gmail.com


Cash flow
P/s
Gross margin
yoy revenue growth


tmux terminal mappings:

o () {
    tmux send-keys -t1 :tabnew\ $(tmux display -p -F "#{pane_current_path}")/"$@" C-m
		tmux select-pane -t1
}

pv () {
    tmux respawn-pane -k -t1 -c "#{pane_current_path}" nvim "$1"
}
wv () {
    tmux respawn-window -k -t1 -c "#{pane_current_path}" nvim "$1"
}
tw () {
  args=$@
  CDD=$(tmux display -p -F "#{pane_current_path}")
  tmux send-keys -t1 :tabnew\ $CDD/"$args" C-m
  tmux select-pane -t1
  # tmux send-keys -t1 :tabnew\ $args C-m
}


# hiding your ip
  sudo openvpn --config vpngate_....ovpn


# sharing files through terminal
  $ transfer hello.txt


sxiv for image in terminal


gpg --keyserver keyserver.ubuntu.com --recv-key 'theimportkey'


use /home/i/undergradmathlatex.pdf to help with latex syntax

for fzfyt (yt from terminal)
  $ yt

for fzf mpd user interface
  $ fmui

use lf or vifm for file managing
