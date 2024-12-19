if [[ $- != *i* ]] ; then
	return
fi

source /etc/profile


export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export LIBVA_DRIVER_NAME=nvidia
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="$PATH:$HOME/.cargo/bin:$HOME/.local/bin/"


alias vpn='wg-quick up wgjp'
alias vpn-off='wg-quick down wgjp'
alias i2pfox='firefox --no-remote -P "i2p"'

alias p='python3'
alias pm='pulsemixer'

alias doas='doas '

alias dwmconf='vim /opt/dwm/config.h'
alias dwmup='$HOME/scripts/dwm/dwmup.sh'
alias stconf='vim /opt/st/config.h'
alias stup='$HOME/scripts/dwm/stup.sh'
alias xup='xrdb $HOME/.Xresources'
alias mozcconf='/usr/libexec/mozc/mozc_tool --mode=config_dialog --config_file=$HOME/.mozc'

alias la='ls -aF'
alias ll='ls -laF'
alias db='du -bs'
alias dh='du -hs'
alias batinfo='upower -i /org/freedesktop/UPower/devices/battery_BAT0'

alias mfeh='feh -Z -B white'
alias hmpv='mpv --profile=pseudo-gui'
alias fmpv='mpv --speed=1.45'
alias ffmpv='mpv --speed=1.75'
alias fffmpv='mpv --speed=2.0'
alias yt-dlp='yt-dlp --retries=inf'
alias yt-dlp-safe='yt-dlp --retries=inf --sleep-requests 1.5 --min-sleep-interval 30 --max-sleep-interval 60'
alias mzathura='zathura --config-dir="$HOME/.config/zathura-manga"'
alias Mzathura='zathura --config-dir="$HOME/.config/zathura-Manga"'

if [ -f '/etc/gentoo-release' ]; then
    alias pek='vim /etc/portage/package.accept_keywords/'
    alias peu='vim /etc/portage/package.use/package.use'
    alias pel='vim /etc/portage/package.license'
    alias pem='vim /etc/portage/package.mask/package.mask'
    alias aemerge='emerge --autounmask --backtrack=100 --autounmask-backtrack=y -avuDN @world'
    alias semerge='EMERGE_DEFAULT_OPTS="--with-bdeps=y" emerge'
    alias update-kernel='$HOME/scripts/update-kernel.sh'
    alias update-grub='grub-mkconfig -o /boot/grub/grub.cfg'

    alias gca='git commit --interactive'

    alias cdw='cd /var/www/localhost/htdocs/'
    alias cdj='cd /mnt/hdd/Japanese/'
    alias cdh='cd /mnt/hdd/'
fi

if [ -f '/etc/devuan_version' ]; then
    alias purgeorphaned='dpkg --purge $(LANG=C dpkg -l | grep ^rc | awk '\''{print $2}'\'')'
fi

if [ -d '$HOME/.winevn' ]; then
    alias winevn='WINEPREFIX=~/.winevn wine'
    alias winetricksvn='WINEPREFIX=~/.winevn winetricks'
    alias txtr='winevn ~/.winevn/drive_c/users/matthias/Desktop/Textractor/x86/Textractor.exe'
fi

dna() {
    ffmpeg -i $1 -ab 128k -af "afftdn=nf=-25" $2
}

alias rmsil='auto-editor -b:a 128k'
alias ca2av1='for file in *.mp4; do ffmpeg -i "$file" -c:v libsvtav1 -crf 38 "${file%.mp4}.webm"; done'
alias vidsabove1080p='shopt -s nullglob; for file in *.{mp4,webm,mkv}; do resolution=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 "$file"); width=$(echo $resolution | cut -d'\''x'\'' -f1); height=$(echo $resolution | cut -d'\''x'\'' -f2);if [ "$width" -gt 1920 ] || [ "$height" -gt 1080 ]; then echo "$file is above 1080p: $resolution"; fi; done; shopt -u nullglob'



# Auto-login
[ "$(tty)" = "/dev/tty1" ] && exec startx
