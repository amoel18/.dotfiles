Adding dotfiles to a new system:

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


postman-bin        #api test build document

wlogout            #lougout menu
