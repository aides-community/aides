#
# bundled via firejail-bundler 0.2.0 (firejail version: 0.9.72)
#
include aides-yandex-browser-stable.local
include globals.local
#region: @bundler [aides-yandex-browser-stable.profile] BEGIN
# This is necessary to insert screenshots
noblacklist ${PICTURES}
whitelist ${PICTURES}

# https://altlinux.space/aides-pkgs/yandex-browser-stable/issues/19
noblacklist ${DESKTOP}
whitelist ${DESKTOP}

#region: partitial fix for https://altlinux.space/aides-pkgs/yandex-browser-stable/issues/23
whitelist /usr/share/doc
#endregion

#region: fix for https://altlinux.space/aides-pkgs/yandex-browser-stable/issues/24
ignore read-only ${HOME}/.config/mimeapps.list
noblacklist ${HOME}/.config/mimeapps.list

noblacklist ${HOME}/.config/yandex-browser
noblacklist ${HOME}/.config/yandex-browser-beta
#region: @bundler [/etc/firejail/whitelist-1793-workaround.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.
# This works around bug 1793, and allows whitelisting to be used for some KDE applications.

noblacklist ${HOME}/.config/ibus
noblacklist ${HOME}/.config/mimeapps.list
noblacklist ${HOME}/.config/pkcs11
noblacklist ${HOME}/.config/user-dirs.dirs
noblacklist ${HOME}/.config/user-dirs.locale
noblacklist ${HOME}/.config/dconf
noblacklist ${HOME}/.config/fontconfig
noblacklist ${HOME}/.config/gtk-2.0
noblacklist ${HOME}/.config/gtk-3.0
noblacklist ${HOME}/.config/gtk-4.0
noblacklist ${HOME}/.config/gtkrc
noblacklist ${HOME}/.config/gtkrc-2.0
noblacklist ${HOME}/.config/Kvantum
noblacklist ${HOME}/.config/Trolltech.conf
noblacklist ${HOME}/.config/QtProject.conf
noblacklist ${HOME}/.config/kdeglobals
noblacklist ${HOME}/.config/kio_httprc
noblacklist ${HOME}/.config/kioslaverc
noblacklist ${HOME}/.config/ksslcablacklist
noblacklist ${HOME}/.config/qt5ct
noblacklist ${HOME}/.config/qt6ct
noblacklist ${HOME}/.config/qtcurve

blacklist ${HOME}/.config/*
whitelist ${HOME}/.config
#endregion: @bundler [/etc/firejail/whitelist-1793-workaround.inc] END
#endregion

# For PWA
ignore read-only ${HOME}/.local/share/applications
read-write ${HOME}/.local/share/applications

# Fix for url
env XDG_CURRENT_DESKTOP=
env DE=flatpak

#region: @bundler [/etc/firejail/yandex-browser.profile] BEGIN
# Firejail profile for yandex-browser
# This file is overwritten after every install/update
# Persistent local customizations
# Persistent global definitions

# Disable for now, see https://github.com/netblue30/firejail/pull/3688#issuecomment-718711565
ignore whitelist /usr/share/mozilla/extensions
ignore whitelist /usr/share/webext
ignore include whitelist-runuser-common.inc
ignore include whitelist-usr-share-common.inc

noblacklist ${HOME}/.cache/yandex-browser
noblacklist ${HOME}/.cache/yandex-browser-beta
noblacklist ${HOME}/.config/yandex-browser
noblacklist ${HOME}/.config/yandex-browser-beta

mkdir ${HOME}/.cache/yandex-browser
mkdir ${HOME}/.cache/yandex-browser-beta
mkdir ${HOME}/.config/yandex-browser
mkdir ${HOME}/.config/yandex-browser-beta
whitelist ${HOME}/.cache/yandex-browser
whitelist ${HOME}/.cache/yandex-browser-beta
whitelist ${HOME}/.config/yandex-browser
whitelist ${HOME}/.config/yandex-browser-beta

# Redirect
#region: @bundler [/etc/firejail/chromium-common.profile] BEGIN
# Firejail profile for chromium-common
# This file is overwritten after every install/update
# Persistent local customizations
# Persistent global definitions
# added by caller profile
#include globals.local

# noexec ${HOME} breaks DRM binaries.
?BROWSER_ALLOW_DRM: ignore noexec ${HOME}

noblacklist ${HOME}/.local/share/pki
noblacklist ${HOME}/.pki
noblacklist /usr/lib/chromium/chrome-sandbox

# Add the next line to your chromium-common.local if you want Google Chrome/Chromium browser
# to have access to Gnome extensions (extensions.gnome.org) via browser connector
#include allow-python3.inc

#region: @bundler [/etc/firejail/disable-common.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

# The following block breaks trash functionality in file managers
#read-only ${HOME}/.local
#read-write ${HOME}/.local/share
blacklist ${HOME}/.local/share/Trash

# History files in $HOME and clipboard managers
blacklist-nolog ${HOME}/.*_history
blacklist-nolog ${HOME}/.*_history_*
blacklist-nolog ${HOME}/.adobe
blacklist-nolog ${HOME}/.ammonite/history
blacklist-nolog ${HOME}/.cache/greenclip*
blacklist-nolog ${HOME}/.cache/mupdf.history
blacklist-nolog ${HOME}/.histfile
blacklist-nolog ${HOME}/.history
blacklist-nolog ${HOME}/.kde/share/apps/klipper
blacklist-nolog ${HOME}/.kde4/share/apps/klipper
blacklist-nolog ${HOME}/.local/share/fish/fish_history
blacklist-nolog ${HOME}/.local/share/ibus-typing-booster
blacklist-nolog ${HOME}/.local/share/klipper
blacklist-nolog ${HOME}/.local/share/nvim
blacklist-nolog ${HOME}/.local/state/nvim
blacklist-nolog ${HOME}/.macromedia
blacklist-nolog ${HOME}/.mupdf.history
blacklist-nolog ${HOME}/.python-history
blacklist-nolog ${HOME}/.python_history
blacklist-nolog ${HOME}/.pythonhist
blacklist-nolog ${HOME}/.lesshst
blacklist-nolog ${HOME}/.viminfo
blacklist-nolog /tmp/clipmenu*

# X11 session autostart
# blacklist ${HOME}/.xpra - this will kill --x11=xpra cmdline option for all programs
blacklist ${HOME}/.Xsession
blacklist ${HOME}/.blackbox
blacklist ${HOME}/.config/autostart
blacklist ${HOME}/.config/autostart-scripts
blacklist ${HOME}/.config/awesome
blacklist ${HOME}/.config/i3
blacklist ${HOME}/.config/sway
blacklist ${HOME}/.config/lxsession/LXDE/autostart
blacklist ${HOME}/.config/openbox
blacklist ${HOME}/.config/plasma-workspace
blacklist ${HOME}/.config/startupconfig
blacklist ${HOME}/.config/startupconfigkeys
blacklist ${HOME}/.fluxbox
blacklist ${HOME}/.gnomerc
blacklist ${HOME}/.kde/Autostart
blacklist ${HOME}/.kde/env
blacklist ${HOME}/.kde/share/autostart
blacklist ${HOME}/.kde/share/config/startupconfig
blacklist ${HOME}/.kde/share/config/startupconfigkeys
blacklist ${HOME}/.kde/shutdown
blacklist ${HOME}/.kde4/env
blacklist ${HOME}/.kde4/Autostart
blacklist ${HOME}/.kde4/share/autostart
blacklist ${HOME}/.kde4/shutdown
blacklist ${HOME}/.kde4/share/config/startupconfig
blacklist ${HOME}/.kde4/share/config/startupconfigkeys
blacklist ${HOME}/.local/share/autostart
blacklist ${HOME}/.xinitrc
blacklist ${HOME}/.xprofile
blacklist ${HOME}/.xserverrc
blacklist ${HOME}/.xsession
blacklist ${HOME}/.xsessionrc
blacklist /etc/X11/Xsession.d
blacklist /etc/xdg/autostart
read-only ${HOME}/.Xauthority

# Session manager
# see #3358
#?HAS_X11: blacklist ${HOME}/.ICEauthority
#?HAS_X11: blacklist /tmp/.ICE-unix

# KDE config
blacklist ${HOME}/.cache/konsole
blacklist ${HOME}/.config/khotkeysrc
blacklist ${HOME}/.config/krunnerrc
blacklist ${HOME}/.config/kscreenlockerrc
blacklist ${HOME}/.config/ksslcertificatemanager
blacklist ${HOME}/.config/kwalletrc
blacklist ${HOME}/.config/kwinrc
blacklist ${HOME}/.config/kwinrulesrc
blacklist ${HOME}/.config/plasma-locale-settings.sh
blacklist ${HOME}/.config/plasma-org.kde.plasma.desktop-appletsrc
blacklist ${HOME}/.config/plasmashellrc
blacklist ${HOME}/.config/plasmavaultrc
blacklist ${HOME}/.kde/share/apps/kwin
blacklist ${HOME}/.kde/share/apps/plasma
blacklist ${HOME}/.kde/share/apps/solid
blacklist ${HOME}/.kde/share/config/khotkeysrc
blacklist ${HOME}/.kde/share/config/krunnerrc
blacklist ${HOME}/.kde/share/config/kscreensaverrc
blacklist ${HOME}/.kde/share/config/ksslcertificatemanager
blacklist ${HOME}/.kde/share/config/kwalletrc
blacklist ${HOME}/.kde/share/config/kwinrc
blacklist ${HOME}/.kde/share/config/kwinrulesrc
blacklist ${HOME}/.kde/share/config/plasma-desktop-appletsrc
blacklist ${HOME}/.kde4/share/apps/kwin
blacklist ${HOME}/.kde4/share/apps/plasma
blacklist ${HOME}/.kde4/share/apps/solid
blacklist ${HOME}/.kde4/share/config/khotkeysrc
blacklist ${HOME}/.kde4/share/config/krunnerrc
blacklist ${HOME}/.kde4/share/config/kscreensaverrc
blacklist ${HOME}/.kde4/share/config/ksslcertificatemanager
blacklist ${HOME}/.kde4/share/config/kwalletrc
blacklist ${HOME}/.kde4/share/config/kwinrc
blacklist ${HOME}/.kde4/share/config/kwinrulesrc
blacklist ${HOME}/.kde4/share/config/plasma-desktop-appletsrc
blacklist ${HOME}/.local/share/kglobalaccel
blacklist ${HOME}/.local/share/kwin
blacklist ${HOME}/.local/share/plasma
blacklist ${HOME}/.local/share/plasmashell
blacklist ${HOME}/.local/share/solid
blacklist /tmp/konsole-*.history
read-only ${HOME}/.cache/ksycoca5_*
read-only ${HOME}/.config/*notifyrc
read-only ${HOME}/.config/kdeglobals
read-only ${HOME}/.config/kio_httprc
read-only ${HOME}/.config/kiorc
read-only ${HOME}/.config/kioslaverc
read-only ${HOME}/.config/ksslcablacklist
read-only ${HOME}/.kde/share/apps/konsole
read-only ${HOME}/.kde/share/apps/kssl
read-only ${HOME}/.kde/share/config/*notifyrc
read-only ${HOME}/.kde/share/config/kdeglobals
read-only ${HOME}/.kde/share/config/kio_httprc
read-only ${HOME}/.kde/share/config/kioslaverc
read-only ${HOME}/.kde/share/config/ksslcablacklist
read-only ${HOME}/.kde/share/kde4/services
read-only ${HOME}/.kde4/share/apps/konsole
read-only ${HOME}/.kde4/share/apps/kssl
read-only ${HOME}/.kde4/share/config/*notifyrc
read-only ${HOME}/.kde4/share/config/kdeglobals
read-only ${HOME}/.kde4/share/config/kio_httprc
read-only ${HOME}/.kde4/share/config/kioslaverc
read-only ${HOME}/.kde4/share/config/ksslcablacklist
read-only ${HOME}/.kde4/share/kde4/services
read-only ${HOME}/.local/share/konsole
read-only ${HOME}/.local/share/kservices5
read-only ${HOME}/.local/share/kssl

# KDE sockets
blacklist ${RUNUSER}/*.slave-socket
blacklist ${RUNUSER}/kdeinit5__*
blacklist ${RUNUSER}/kdesud_*
# see #3358
#?HAS_NODBUS: blacklist ${RUNUSER}/ksocket-*
#?HAS_NODBUS: blacklist /tmp/ksocket-*

# gnome
# contains extensions, last used times of applications, and notifications
blacklist ${HOME}/.local/share/gnome-shell
# contains recently used files and serials of static/removable storage
blacklist ${HOME}/.local/share/gvfs-metadata
# no direct modification of dconf database
read-only ${HOME}/.config/dconf
blacklist ${RUNUSER}/gnome-session-leader-fifo
blacklist ${RUNUSER}/gnome-shell
blacklist ${RUNUSER}/gsconnect

# systemd
blacklist ${HOME}/.config/systemd
blacklist ${HOME}/.local/share/systemd
blacklist ${PATH}/systemctl
blacklist ${PATH}/systemd-run
blacklist ${RUNUSER}/systemd
blacklist /etc/systemd/network
blacklist /etc/systemd/system
blacklist /var/lib/systemd
# creates problems on Arch where /etc/resolv.conf is a symlink to /var/run/systemd/resolve/resolv.conf
#blacklist /var/run/systemd

# openrc
blacklist /etc/init.d
blacklist /etc/rc.conf
blacklist /etc/runlevels

# VirtualBox
blacklist ${HOME}/.config/VirtualBox
blacklist ${HOME}/.VirtualBox
blacklist ${HOME}/VirtualBox VMs

# GNOME Boxes
blacklist ${HOME}/.config/gnome-boxes
blacklist ${HOME}/.local/share/gnome-boxes

# libvirt
blacklist ${HOME}/.cache/libvirt
blacklist ${HOME}/.config/libvirt
blacklist ${RUNUSER}/libvirt
blacklist /var/cache/libvirt
blacklist /var/lib/libvirt
blacklist /var/log/libvirt

# OCI-Containers / Podman
blacklist ${RUNUSER}/containers
blacklist ${RUNUSER}/crun
blacklist ${RUNUSER}/libpod
blacklist ${RUNUSER}/runc
blacklist ${RUNUSER}/toolbox

# VeraCrypt
blacklist ${HOME}/.VeraCrypt
blacklist ${PATH}/veracrypt
blacklist ${PATH}/veracrypt-uninstall.sh
blacklist /usr/share/applications/veracrypt.*
blacklist /usr/share/pixmaps/veracrypt.*
blacklist /usr/share/veracrypt

# TrueCrypt
blacklist ${HOME}/.TrueCrypt
blacklist ${PATH}/truecrypt
blacklist ${PATH}/truecrypt-uninstall.sh
blacklist /usr/share/applications/truecrypt.*
blacklist /usr/share/pixmaps/truecrypt.*
blacklist /usr/share/truecrypt

# zuluCrypt
blacklist ${HOME}/.zuluCrypt
blacklist ${HOME}/.zuluCrypt-socket
blacklist ${PATH}/zuluCrypt-cli
blacklist ${PATH}/zuluMount-cli

# var
blacklist /var/cache/apt
blacklist /var/cache/pacman
blacklist /var/lib/apt
blacklist /var/lib/clamav
blacklist /var/lib/dkms
blacklist /var/lib/mysql/mysql.sock
blacklist /var/lib/mysqld/mysql.sock
blacklist /var/lib/pacman
blacklist /var/lib/upower
# blacklist /var/log - a virtual /var/log directory (mostly empty) is build up by default for
# every sandbox, unless --writable-var-log switch is activated
blacklist /var/mail
blacklist /var/opt
blacklist /var/run/acpid.socket
blacklist /var/run/docker.sock
blacklist /var/run/minissdpd.sock
blacklist /var/run/mysql/mysqld.sock
blacklist /var/run/mysqld/mysqld.sock
blacklist /var/run/rpcbind.sock
blacklist /var/run/screens
blacklist /var/spool/anacron
blacklist /var/spool/cron
blacklist /var/spool/mail

# etc
blacklist /etc/adduser.conf
blacklist /etc/anacrontab
blacklist /etc/apparmor*
blacklist /etc/cron*
blacklist /etc/default
blacklist /etc/dkms
blacklist /etc/grub*
blacklist /etc/kernel*
blacklist /etc/logrotate*
blacklist /etc/modules*
blacklist /etc/rc.local
# rc1.d, rc2.d, ...
blacklist /etc/rc?.d
blacklist /etc/sysconfig

# hide config for various intrusion detection systems
blacklist /etc/aide
blacklist /etc/aide.conf
blacklist /etc/chkrootkit.conf
blacklist /etc/fail2ban.conf
blacklist /etc/logcheck
blacklist /etc/lynis
blacklist /etc/rkhunter.*
blacklist /etc/snort
blacklist /etc/suricata
blacklist /etc/tripwire
blacklist /var/lib/rkhunter

# Startup files
read-only ${HOME}/.antigen
read-only ${HOME}/.bash_aliases
read-only ${HOME}/.bash_login
read-only ${HOME}/.bash_logout
read-only ${HOME}/.bash_profile
read-only ${HOME}/.bashrc
read-only ${HOME}/.config/environment.d
read-only ${HOME}/.config/fish
read-only ${HOME}/.csh_files
read-only ${HOME}/.cshrc
read-only ${HOME}/.forward
read-only ${HOME}/.kshrc
read-only ${HOME}/.local/share/fish
read-only ${HOME}/.login
read-only ${HOME}/.logout
read-only ${HOME}/.mkshrc
read-only ${HOME}/.oh-my-zsh
read-only ${HOME}/.pam_environment
read-only ${HOME}/.pgpkey
read-only ${HOME}/.plan
read-only ${HOME}/.profile
read-only ${HOME}/.project
read-only ${HOME}/.tcshrc
read-only ${HOME}/.zfunc
read-only ${HOME}/.zlogin
read-only ${HOME}/.zlogout
read-only ${HOME}/.zprofile
read-only ${HOME}/.zsh.d
read-only ${HOME}/.zsh_files
read-only ${HOME}/.zshenv
read-only ${HOME}/.zshrc
read-only ${HOME}/.zshrc.local

# Remote access
blacklist ${HOME}/.rhosts
blacklist ${HOME}/.shosts
blacklist ${HOME}/.ssh/authorized_keys
blacklist ${HOME}/.ssh/authorized_keys2
blacklist ${HOME}/.ssh/environment
blacklist ${HOME}/.ssh/rc
blacklist /etc/hosts.equiv
read-only ${HOME}/.ssh/config
read-only ${HOME}/.ssh/config.d

# Initialization files that allow arbitrary command execution
read-only ${HOME}/.caffrc
read-only ${HOME}/.cargo/env
read-only ${HOME}/.config/nvim
read-only ${HOME}/.config/pkcs11
read-only ${HOME}/.dotfiles
read-only ${HOME}/.emacs
read-only ${HOME}/.emacs.d
read-only ${HOME}/.exrc
read-only ${HOME}/.gvimrc
read-only ${HOME}/.homesick
read-only ${HOME}/.iscreenrc
read-only ${HOME}/.local/lib
read-only ${HOME}/.local/share/cool-retro-term
read-only ${HOME}/.local/share/nvim
read-only ${HOME}/.local/state/nvim
read-only ${HOME}/.mailcap
read-only ${HOME}/.msmtprc
read-only ${HOME}/.mutt/muttrc
read-only ${HOME}/.muttrc
read-only ${HOME}/.nano
read-only ${HOME}/.npmrc
read-only ${HOME}/.pythonrc.py
read-only ${HOME}/.reportbugrc
read-only ${HOME}/.tmux.conf
read-only ${HOME}/.vim
read-only ${HOME}/.viminfo
read-only ${HOME}/.vimrc
read-only ${HOME}/.xmonad
read-only ${HOME}/.xscreensaver
read-only ${HOME}/.yarnrc
read-only ${HOME}/_exrc
read-only ${HOME}/_gvimrc
read-only ${HOME}/_vimrc
read-only ${HOME}/dotfiles

# Make directories commonly found in $PATH read-only
read-only ${HOME}/.bin
read-only ${HOME}/.cargo/bin
read-only ${HOME}/.gem
read-only ${HOME}/.local/bin
read-only ${HOME}/.local/share/coursier/bin
read-only ${HOME}/.luarocks
read-only ${HOME}/.npm-packages
read-only ${HOME}/.nvm
read-only ${HOME}/.rustup
read-only ${HOME}/bin

# Write-protection for portable apps
read-only ${HOME}/Applications # used for storing AppImages

# Write-protection for desktop entries
read-only ${HOME}/.config/menus
read-only ${HOME}/.gnome/apps
read-only ${HOME}/.local/share/applications

read-only ${HOME}/.config/mimeapps.list
read-only ${HOME}/.config/user-dirs.dirs
read-only ${HOME}/.config/user-dirs.locale
read-only ${HOME}/.local/share/mime

# Write-protection for thumbnailer dir
read-only ${HOME}/.local/share/thumbnailers

# prevent access to ssh-agent
blacklist /tmp/ssh-*

# top secret
blacklist /.fscrypt
blacklist /etc/davfs2/secrets
blacklist /etc/group+
blacklist /etc/group-
blacklist /etc/gshadow
blacklist /etc/gshadow+
blacklist /etc/gshadow-
blacklist /etc/passwd+
blacklist /etc/passwd-
blacklist /etc/shadow
blacklist /etc/shadow+
blacklist /etc/shadow-
blacklist /etc/ssh
blacklist /etc/ssh/*
blacklist /home/.ecryptfs
blacklist /home/.fscrypt
blacklist ${HOME}/*.kdb
blacklist ${HOME}/*.kdbx
blacklist ${HOME}/*.key
blacklist ${HOME}/Private
blacklist ${HOME}/.Private
blacklist ${HOME}/.caff
blacklist ${HOME}/.cargo/credentials
blacklist ${HOME}/.cargo/credentials.toml
blacklist ${HOME}/.cert
blacklist ${HOME}/.config/hub
blacklist ${HOME}/.config/keybase
blacklist ${HOME}/.davfs2/secrets
blacklist ${HOME}/.ecryptfs
blacklist ${HOME}/.fetchmailrc
blacklist ${HOME}/.fscrypt
blacklist ${HOME}/.git-credential-cache
blacklist ${HOME}/.git-credentials
blacklist ${HOME}/.gnome2/keyrings
blacklist ${HOME}/.gnupg
blacklist ${HOME}/.kde/share/apps/kwallet
blacklist ${HOME}/.kde4/share/apps/kwallet
blacklist ${HOME}/.local/share/keyrings
blacklist ${HOME}/.local/share/kwalletd
blacklist ${HOME}/.local/share/pki
blacklist ${HOME}/.local/share/plasma-vault
blacklist ${HOME}/.minisign
blacklist ${HOME}/.msmtprc
blacklist ${HOME}/.mutt
blacklist ${HOME}/.muttrc
blacklist ${HOME}/.netrc
blacklist ${HOME}/.nyx
blacklist ${HOME}/.pki
blacklist ${HOME}/.smbcredentials
blacklist ${HOME}/.ssh
blacklist ${HOME}/.vaults
blacklist /run/timeshift
blacklist /var/backup

# Remove environment variables with auth tokens.
# Note however that the sandbox might still have access to the
# files where these variables are set.
rmenv GH_TOKEN
rmenv GITHUB_TOKEN
rmenv GH_ENTERPRISE_TOKEN
rmenv GITHUB_ENTERPRISE_TOKEN
rmenv CARGO_REGISTRY_TOKEN
rmenv RESTIC_KEY_HINT
rmenv RESTIC_PASSWORD_COMMAND
rmenv RESTIC_PASSWORD_FILE

# cloud provider configuration
blacklist ${HOME}/.aws
blacklist ${HOME}/.boto
blacklist ${HOME}/.config/gcloud
blacklist ${HOME}/.kube
blacklist ${HOME}/.passwd-s3fs
blacklist ${HOME}/.s3cmd
blacklist /etc/boto.cfg

# system directories
blacklist /sbin
blacklist /usr/local/sbin
blacklist /usr/sbin

# system management and various SUID executables
blacklist ${PATH}/at
blacklist ${PATH}/busybox
blacklist ${PATH}/chage
blacklist ${PATH}/chfn
blacklist ${PATH}/chsh
blacklist ${PATH}/crontab
blacklist ${PATH}/doas
blacklist ${PATH}/evtest
blacklist ${PATH}/expiry
blacklist ${PATH}/fusermount
blacklist ${PATH}/gksu
blacklist ${PATH}/gksudo
blacklist ${PATH}/gpasswd
blacklist ${PATH}/kdesudo
blacklist ${PATH}/ksu
blacklist ${PATH}/mount
blacklist ${PATH}/mount.ecryptfs_private
blacklist ${PATH}/nc
blacklist ${PATH}/ncat
blacklist ${PATH}/nmap
blacklist ${PATH}/newgidmap
blacklist ${PATH}/newgrp
blacklist ${PATH}/newuidmap
blacklist ${PATH}/ntfs-3g
blacklist ${PATH}/pkexec
blacklist ${PATH}/procmail
blacklist ${PATH}/sg
blacklist ${PATH}/strace
blacklist ${PATH}/su
blacklist ${PATH}/sudo
blacklist ${PATH}/tcpdump
blacklist ${PATH}/umount
blacklist ${PATH}/unix_chkpwd
blacklist ${PATH}/xev
blacklist ${PATH}/xinput
# from 0.9.67
blacklist /usr/lib/openssh
blacklist /usr/lib/ssh
blacklist /usr/libexec/openssh
blacklist ${PATH}/passwd
blacklist /usr/lib/xorg/Xorg.wrap
blacklist /usr/lib/policykit-1/polkit-agent-helper-1
blacklist /usr/lib/dbus-1.0/dbus-daemon-launch-helper
blacklist /usr/lib/eject/dmcrypt-get-device
blacklist /usr/lib/chromium/chrome-sandbox
blacklist /usr/lib/opera/opera_sandbox
blacklist /usr/lib/vmware
blacklist ${PATH}/suexec
blacklist /usr/lib/squid/basic_pam_auth
blacklist ${PATH}/slock
blacklist ${PATH}/physlock
blacklist ${PATH}/schroot
blacklist ${PATH}/wshowkeys
blacklist ${PATH}/pmount
blacklist ${PATH}/pumount
blacklist ${PATH}/bmon
blacklist ${PATH}/fping
blacklist ${PATH}/fping6
blacklist ${PATH}/hostname
# blacklist ${PATH}/ip - breaks --ip=dhcp
blacklist ${PATH}/mtr
blacklist ${PATH}/mtr-packet
blacklist ${PATH}/netstat
blacklist ${PATH}/nm-online
blacklist ${PATH}/nmcli
blacklist ${PATH}/nmtui
blacklist ${PATH}/nmtui-connect
blacklist ${PATH}/nmtui-edit
blacklist ${PATH}/nmtui-hostname
blacklist ${PATH}/networkctl
blacklist ${PATH}/ss
blacklist ${PATH}/traceroute

# other SUID binaries
blacklist /usr/lib/virtualbox
blacklist /usr/lib64/virtualbox

# prevent lxterminal connecting to an existing lxterminal session
blacklist /tmp/.lxterminal-socket*
# prevent tmux connecting to an existing session
blacklist /tmp/tmux-*

# disable terminals running as server resulting in sandbox escape
blacklist ${PATH}/gnome-terminal
blacklist ${PATH}/gnome-terminal.wrapper
blacklist ${PATH}/kgx
# blacklist ${PATH}/konsole
# konsole doesn't seem to have this problem - last tested on Ubuntu 16.04
blacklist ${PATH}/lilyterm
blacklist ${PATH}/lxterminal
blacklist ${PATH}/mate-terminal
blacklist ${PATH}/mate-terminal.wrapper
blacklist ${PATH}/pantheon-terminal
blacklist ${PATH}/roxterm
blacklist ${PATH}/roxterm-config
blacklist ${PATH}/terminix
blacklist ${PATH}/tilix
blacklist ${PATH}/urxvtc
blacklist ${PATH}/urxvtcd
blacklist ${PATH}/xfce4-terminal
blacklist ${PATH}/xfce4-terminal.wrapper

# kernel files
blacklist /initrd*
blacklist /vmlinuz*

# snapshot files
blacklist /.snapshots

# flatpak
blacklist ${HOME}/.cache/flatpak
blacklist ${HOME}/.config/flatpak
noblacklist ${HOME}/.local/share/flatpak/exports
read-only ${HOME}/.local/share/flatpak/exports
blacklist ${HOME}/.local/share/flatpak/*
blacklist ${HOME}/.var
# most of the time bwrap is SUID binary
blacklist ${PATH}/bwrap
blacklist ${RUNUSER}/.dbus-proxy
blacklist ${RUNUSER}/.flatpak
blacklist ${RUNUSER}/.flatpak-cache
blacklist ${RUNUSER}/.flatpak-helper
blacklist ${RUNUSER}/app
blacklist ${RUNUSER}/doc
blacklist /usr/share/flatpak
noblacklist /var/lib/flatpak/exports
blacklist /var/lib/flatpak/*

# snap
blacklist ${HOME}/snap
blacklist ${PATH}/snap
blacklist ${PATH}/snapctl
blacklist ${RUNUSER}/snapd-session-agent.socket
blacklist /snap
blacklist /usr/lib/snapd
blacklist /var/lib/snapd
blacklist /var/snap

# mail directories used by mutt
blacklist ${HOME}/.Mail
blacklist ${HOME}/.mail
blacklist ${HOME}/.signature
blacklist ${HOME}/Mail
blacklist ${HOME}/mail
blacklist ${HOME}/postponed
blacklist ${HOME}/sent

# kernel configuration - keep this here although it's also in disable-proc.inc
blacklist /proc/config.gz

# prevent DNS malware attempting to communicate with the server using regular DNS tools
blacklist ${PATH}/dig
blacklist ${PATH}/dlint
blacklist ${PATH}/dns2tcp
blacklist ${PATH}/dnssec-*
blacklist ${PATH}/dnswalk
blacklist ${PATH}/drill
blacklist ${PATH}/host
blacklist ${PATH}/iodine
blacklist ${PATH}/kdig
blacklist ${PATH}/khost
blacklist ${PATH}/knsupdate
blacklist ${PATH}/ldns-*
blacklist ${PATH}/ldnsd
blacklist ${PATH}/nslookup
blacklist ${PATH}/resolvectl
blacklist ${PATH}/unbound-host

# prevent an intruder to guess passwords using regular network tools
blacklist ${PATH}/ftp
blacklist ${PATH}/ssh
blacklist ${PATH}/telnet

# rest of ${RUNUSER}
blacklist ${RUNUSER}/*.lock
blacklist ${RUNUSER}/inaccessible
blacklist ${RUNUSER}/pk-debconf-socket
blacklist ${RUNUSER}/update-notifier.pid

# tor-browser
blacklist ${HOME}/.local/opt/tor-browser

# pass utility (pass package in Debian etc.)
blacklist ${HOME}/.password-store
#endregion: @bundler [/etc/firejail/disable-common.inc] END
#region: @bundler [/etc/firejail/disable-devel.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

# development tools

# clang/llvm
blacklist ${PATH}/clang*
blacklist ${PATH}/lldb*
blacklist ${PATH}/llvm*
# see issue #2106 - it disables hardware acceleration in Firefox on Radeon GPU
# blacklist /usr/lib/llvm*

# GCC
blacklist ${PATH}/as
blacklist ${PATH}/cc
blacklist ${PATH}/c++*
blacklist ${PATH}/c8*
blacklist ${PATH}/c9*
blacklist ${PATH}/cpp*
blacklist ${PATH}/g++*
blacklist ${PATH}/gcc*
blacklist ${PATH}/gdb
blacklist ${PATH}/ld
blacklist ${PATH}/*-gcc*
blacklist ${PATH}/*-g++*
blacklist ${PATH}/*-gcc*
blacklist ${PATH}/*-g++*
# seems to create problems on Gentoo
#blacklist /usr/lib/gcc

#Go
blacklist ${PATH}/gccgo
blacklist ${PATH}/go
blacklist ${PATH}/gofmt

# Java
blacklist ${PATH}/java
blacklist ${PATH}/javac
blacklist /etc/java
blacklist /usr/lib/java
blacklist /usr/share/java

# Scala
blacklist ${PATH}/scala
blacklist ${PATH}/scala3
blacklist ${PATH}/scala3-compiler
blacklist ${PATH}/scala3-repl
blacklist ${PATH}/scalac

#OpenSSL
blacklist ${PATH}/openssl
blacklist ${PATH}/openssl-1.0

#Rust
blacklist ${PATH}/rust-gdb
blacklist ${PATH}/rust-lldb
blacklist ${PATH}/rustc
blacklist ${HOME}/.rustup

# tcc - Tiny C Compiler
blacklist ${PATH}/tcc
blacklist ${PATH}/x86_64-tcc
blacklist /usr/lib/tcc

# Valgrind
blacklist ${PATH}/valgrind*
blacklist /usr/lib/valgrind

# Source-Code
blacklist /usr/src
blacklist /usr/local/src
blacklist /usr/include
blacklist /usr/local/include
#endregion: @bundler [/etc/firejail/disable-devel.inc] END
#region: @bundler [/etc/firejail/disable-exec.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

noexec ${HOME}
noexec ${RUNUSER}
noexec /dev/mqueue
noexec /dev/shm
noexec /run/shm
noexec /tmp
# /var is noexec by default for unprivileged users
# except there is a writable-var option, so just in case:
noexec /var
#endregion: @bundler [/etc/firejail/disable-exec.inc] END
#region: @bundler [/etc/firejail/disable-interpreters.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

# gjs
blacklist ${PATH}/gjs
blacklist ${PATH}/gjs-console
blacklist /usr/lib/gjs
blacklist /usr/lib/libgjs*
blacklist /usr/lib64/gjs
blacklist /usr/lib64/libgjs*

# Lua
blacklist ${PATH}/lua*
blacklist /usr/include/lua*
blacklist /usr/lib/liblua*
blacklist /usr/lib/lua
blacklist /usr/lib64/liblua*
blacklist /usr/lib64/lua
blacklist /usr/share/lua*

# mozjs
blacklist /usr/lib/libmozjs-*
blacklist /usr/lib64/libmozjs-*

# Node.js
blacklist ${PATH}/node
blacklist /usr/include/node

# nvm
blacklist ${HOME}/.nvm

# Perl
blacklist ${PATH}/core_perl
blacklist ${PATH}/cpan*
blacklist ${PATH}/perl
blacklist ${PATH}/site_perl
blacklist ${PATH}/vendor_perl
blacklist /usr/lib/perl*
blacklist /usr/lib64/perl*
blacklist /usr/share/perl*

# rxvt needs Perl modules, thus does not work. In particular, blacklisting
# it is needed so that Firefox can run applications with Terminal=true in
# their .desktop file (depending on what is installed). The reason is that
# this is done via glib, which currently uses a hardcoded list of terminal
# emulators:
#   https://gitlab.gnome.org/GNOME/glib/-/issues/338
# And in this list, rxvt comes before xterm.
blacklist ${PATH}/rxvt

# PHP
blacklist ${PATH}/php*
blacklist /usr/lib/php*
blacklist /usr/share/php*

# Ruby
blacklist ${PATH}/ruby
blacklist /usr/lib/ruby
blacklist /usr/lib64/ruby

# Programs using python: deluge, firefox addons, filezilla, cherrytree, xchat, hexchat, libreoffice, scribus
# Python 2
blacklist ${PATH}/python2*
blacklist /usr/include/python2*
blacklist /usr/lib/python2*
blacklist /usr/local/lib/python2*
blacklist /usr/share/python2*

# You will want to add noblacklist for python3 stuff in the firefox and/or chromium profiles if you use the Gnome connector (see Issue #2026)

# Python 3
blacklist ${PATH}/python3*
blacklist /usr/include/python3*
blacklist /usr/lib/python3*
blacklist /usr/lib64/python3*
blacklist /usr/local/lib/python3*
blacklist /usr/share/python3*
#endregion: @bundler [/etc/firejail/disable-interpreters.inc] END
#region: @bundler [/etc/firejail/disable-programs.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

blacklist ${HOME}/.*coin
blacklist ${HOME}/.8pecxstudios
blacklist ${HOME}/.AndroidStudio*
blacklist ${HOME}/.Atom
blacklist ${HOME}/.CLion*
blacklist ${HOME}/.FBReader
blacklist ${HOME}/.FontForge
blacklist ${HOME}/.IdeaIC*
blacklist ${HOME}/.LuminanceHDR
blacklist ${HOME}/.Mathematica
blacklist ${HOME}/.Natron
blacklist ${HOME}/.PlayOnLinux
blacklist ${HOME}/.PyCharm*
blacklist ${HOME}/.Sayonara
blacklist ${HOME}/.Steam
blacklist ${HOME}/.Steampath
blacklist ${HOME}/.Steampid
blacklist ${HOME}/.TelegramDesktop
blacklist ${HOME}/.VSCodium
blacklist ${HOME}/.ViberPC
blacklist ${HOME}/.VirtualBox
blacklist ${HOME}/.WebStorm*
blacklist ${HOME}/.Wolfram Research
blacklist ${HOME}/.ZAP
blacklist ${HOME}/.aMule
blacklist ${HOME}/.abook
blacklist ${HOME}/.addressbook
blacklist ${HOME}/.alpine-smime
blacklist ${HOME}/.ammonite
blacklist ${HOME}/.android
blacklist ${HOME}/.anydesk
blacklist ${HOME}/.arduino15
blacklist ${HOME}/.aria2
blacklist ${HOME}/.arm
blacklist ${HOME}/.asunder_album_artist
blacklist ${HOME}/.asunder_album_genre
blacklist ${HOME}/.asunder_album_title
blacklist ${HOME}/.atom
blacklist ${HOME}/.attic
blacklist ${HOME}/.audacity-data
blacklist ${HOME}/.avidemux3
blacklist ${HOME}/.avidemux6
blacklist ${HOME}/.ballbuster.hs
blacklist ${HOME}/.balsa
blacklist ${HOME}/.bcast5
blacklist ${HOME}/.bibletime
blacklist ${HOME}/.bitcoin
blacklist ${HOME}/.blobby
blacklist ${HOME}/.bogofilter
blacklist ${HOME}/.bundle
blacklist ${HOME}/.bzf
blacklist ${HOME}/.cache/0ad
blacklist ${HOME}/.cache/8pecxstudios
blacklist ${HOME}/.cache/Authenticator
blacklist ${HOME}/.cache/BraveSoftware
blacklist ${HOME}/.cache/Clementine
blacklist ${HOME}/.cache/ENCOM/Spectral
blacklist ${HOME}/.cache/Enox
blacklist ${HOME}/.cache/Enpass
blacklist ${HOME}/.cache/Ferdi
blacklist ${HOME}/.cache/Flavio Tordini
blacklist ${HOME}/.cache/Franz
blacklist ${HOME}/.cache/GoldenDict
blacklist ${HOME}/.cache/INRIA
blacklist ${HOME}/.cache/INRIA/Natron
blacklist ${HOME}/.cache/JetBrains/CLion*
blacklist ${HOME}/.cache/JetBrains/PyCharm*
blacklist ${HOME}/.cache/KDE/neochat
blacklist ${HOME}/.cache/Mendeley Ltd.
blacklist ${HOME}/.cache/MusicBrainz
blacklist ${HOME}/.cache/NewsFlashGTK
blacklist ${HOME}/.cache/Otter
blacklist ${HOME}/.cache/PawelStolowski
blacklist ${HOME}/.cache/Psi
blacklist ${HOME}/.cache/QuiteRss
blacklist ${HOME}/.cache/Quotient/quaternion
blacklist ${HOME}/.cache/Shortwave
blacklist ${HOME}/.cache/Tox
blacklist ${HOME}/.cache/Zeal
blacklist ${HOME}/.cache/agenda
blacklist ${HOME}/.cache/akonadi*
blacklist ${HOME}/.cache/atril
blacklist ${HOME}/.cache/attic
blacklist ${HOME}/.cache/audacity
blacklist ${HOME}/.cache/babl
blacklist ${HOME}/.cache/bnox
blacklist ${HOME}/.cache/borg
blacklist ${HOME}/.cache/cachy
blacklist ${HOME}/.cache/calibre
blacklist ${HOME}/.cache/cantata
blacklist ${HOME}/.cache/champlain
blacklist ${HOME}/.cache/chromium
blacklist ${HOME}/.cache/chromium-dev
blacklist ${HOME}/.cache/cliqz
blacklist ${HOME}/.cache/com.github.johnfactotum.Foliate
blacklist ${HOME}/.cache/darktable
blacklist ${HOME}/.cache/deja-dup
blacklist ${HOME}/.cache/discover
blacklist ${HOME}/.cache/dnox
blacklist ${HOME}/.cache/dolphin
blacklist ${HOME}/.cache/dolphin-emu
blacklist ${HOME}/.cache/ephemeral
blacklist ${HOME}/.cache/epiphany
blacklist ${HOME}/.cache/evolution
blacklist ${HOME}/.cache/falkon
blacklist ${HOME}/.cache/feedreader
blacklist ${HOME}/.cache/firedragon
blacklist ${HOME}/.cache/flaska.net/trojita
blacklist ${HOME}/.cache/folks
blacklist ${HOME}/.cache/font-manager
blacklist ${HOME}/.cache/fossamail
blacklist ${HOME}/.cache/fractal
blacklist ${HOME}/.cache/freecol
blacklist ${HOME}/.cache/gajim
blacklist ${HOME}/.cache/gdfuse
blacklist ${HOME}/.cache/geary
blacklist ${HOME}/.cache/geeqie
blacklist ${HOME}/.cache/gegl-0.4
blacklist ${HOME}/.cache/gfeeds
blacklist ${HOME}/.cache/gimp
blacklist ${HOME}/.cache/gnome-boxes
blacklist ${HOME}/.cache/gnome-builder
blacklist ${HOME}/.cache/gnome-control-center
blacklist ${HOME}/.cache/gnome-recipes
blacklist ${HOME}/.cache/gnome-screenshot
blacklist ${HOME}/.cache/gnome-software
blacklist ${HOME}/.cache/gnome-twitch
blacklist ${HOME}/.cache/godot
blacklist ${HOME}/.cache/google-chrome
blacklist ${HOME}/.cache/google-chrome-beta
blacklist ${HOME}/.cache/google-chrome-unstable
blacklist ${HOME}/.cache/gradio
blacklist ${HOME}/.cache/gummi
blacklist ${HOME}/.cache/icedove
blacklist ${HOME}/.cache/inkscape
blacklist ${HOME}/.cache/inox
blacklist ${HOME}/.cache/io.github.lainsce.Notejot
blacklist ${HOME}/.cache/iridium
blacklist ${HOME}/.cache/kcmshell5
blacklist ${HOME}/.cache/kdenlive
blacklist ${HOME}/.cache/keepassxc
blacklist ${HOME}/.cache/kfind
blacklist ${HOME}/.cache/kinfocenter
blacklist ${HOME}/.cache/kmail2
blacklist ${HOME}/.cache/krunner
blacklist ${HOME}/.cache/krunnerbookmarkrunnerfirefoxdbfile.sqlite*
blacklist ${HOME}/.cache/kscreenlocker_greet
blacklist ${HOME}/.cache/ksmserver-logout-greeter
blacklist ${HOME}/.cache/ksplashqml
blacklist ${HOME}/.cache/kube
blacklist ${HOME}/.cache/kwin
blacklist ${HOME}/.cache/lbry-viewer
blacklist ${HOME}/.cache/libgweather
blacklist ${HOME}/.cache/librewolf
blacklist ${HOME}/.cache/liferea
blacklist ${HOME}/.cache/lutris
blacklist ${HOME}/.cache/marker
blacklist ${HOME}/.cache/matrix-mirage
blacklist ${HOME}/.cache/microsoft-edge
blacklist ${HOME}/.cache/microsoft-edge-beta
blacklist ${HOME}/.cache/microsoft-edge-dev
blacklist ${HOME}/.cache/midori
blacklist ${HOME}/.cache/minetest
blacklist ${HOME}/.cache/mirage
blacklist ${HOME}/.cache/moonchild productions/basilisk
blacklist ${HOME}/.cache/moonchild productions/pale moon
blacklist ${HOME}/.cache/mozilla
blacklist ${HOME}/.cache/ms-excel-online
blacklist ${HOME}/.cache/ms-office-online
blacklist ${HOME}/.cache/ms-onenote-online
blacklist ${HOME}/.cache/ms-outlook-online
blacklist ${HOME}/.cache/ms-powerpoint-online
blacklist ${HOME}/.cache/ms-skype-online
blacklist ${HOME}/.cache/ms-word-online
blacklist ${HOME}/.cache/mutt
blacklist ${HOME}/.cache/mypaint
blacklist ${HOME}/.cache/netsurf
blacklist ${HOME}/.cache/nheko
blacklist ${HOME}/.cache/nvim
blacklist ${HOME}/.cache/ocenaudio
blacklist ${HOME}/.cache/okular
blacklist ${HOME}/.cache/opera
blacklist ${HOME}/.cache/opera-beta
blacklist ${HOME}/.cache/opera-developer
blacklist ${HOME}/.cache/org.gabmus.gfeeds
blacklist ${HOME}/.cache/org.gnome.Books
blacklist ${HOME}/.cache/org.gnome.Maps
blacklist ${HOME}/.cache/pdfmod
blacklist ${HOME}/.cache/peek
blacklist ${HOME}/.cache/pip
blacklist ${HOME}/.cache/pipe-viewer
blacklist ${HOME}/.cache/plasmashell
blacklist ${HOME}/.cache/plasmashellbookmarkrunnerfirefoxdbfile.sqlite*
blacklist ${HOME}/.cache/psi
blacklist ${HOME}/.cache/qBittorrent
blacklist ${HOME}/.cache/quodlibet
blacklist ${HOME}/.cache/qupzilla
blacklist ${HOME}/.cache/qutebrowser
blacklist ${HOME}/.cache/rclone
blacklist ${HOME}/.cache/rednotebook
blacklist ${HOME}/.cache/rhythmbox
blacklist ${HOME}/.cache/rpcs3
blacklist ${HOME}/.cache/shotwell
blacklist ${HOME}/.cache/simple-scan
blacklist ${HOME}/.cache/slimjet
blacklist ${HOME}/.cache/smuxi
blacklist ${HOME}/.cache/snox
blacklist ${HOME}/.cache/spotify
blacklist ${HOME}/.cache/straw-viewer
blacklist ${HOME}/.cache/strawberry
blacklist ${HOME}/.cache/supertuxkart
blacklist ${HOME}/.cache/systemsettings
blacklist ${HOME}/.cache/telepathy
blacklist ${HOME}/.cache/thunderbird
blacklist ${HOME}/.cache/torbrowser
blacklist ${HOME}/.cache/transmission
blacklist ${HOME}/.cache/ungoogled-chromium
blacklist ${HOME}/.cache/vivaldi
blacklist ${HOME}/.cache/vivaldi-snapshot
blacklist ${HOME}/.cache/vlc
blacklist ${HOME}/.cache/vmware
blacklist ${HOME}/.cache/warsow-2.1
blacklist ${HOME}/.cache/waterfox
blacklist ${HOME}/.cache/wesnoth
blacklist ${HOME}/.cache/wine
blacklist ${HOME}/.cache/winetricks
blacklist ${HOME}/.cache/xmms2
blacklist ${HOME}/.cache/xournalpp
blacklist ${HOME}/.cache/xreader
blacklist ${HOME}/.cache/yandex-browser
blacklist ${HOME}/.cache/yandex-browser-beta
blacklist ${HOME}/.cache/youtube-dl
blacklist ${HOME}/.cache/youtube-viewer
blacklist ${HOME}/.cache/yt-dlp
blacklist ${HOME}/.cache/zim
blacklist ${HOME}/.cachy
blacklist ${HOME}/.cargo
blacklist ${HOME}/.claws-mail
blacklist ${HOME}/.clion*
blacklist ${HOME}/.cliqz
blacklist ${HOME}/.clonk
blacklist ${HOME}/.config/0ad
blacklist ${HOME}/.config/1Password
blacklist ${HOME}/.config/2048-qt
blacklist ${HOME}/.config/Atom
blacklist ${HOME}/.config/Audaciousrc
blacklist ${HOME}/.config/Authenticator
blacklist ${HOME}/.config/Beaker Browser
blacklist ${HOME}/.config/Bitcoin
blacklist ${HOME}/.config/Bitwarden
blacklist ${HOME}/.config/Brackets
blacklist ${HOME}/.config/BraveSoftware
blacklist ${HOME}/.config/Clementine
blacklist ${HOME}/.config/ClipGrab
blacklist ${HOME}/.config/Code
blacklist ${HOME}/.config/Code - OSS
blacklist ${HOME}/.config/Code Industry
blacklist ${HOME}/.config/Cryptocat
blacklist ${HOME}/.config/Debauchee/Barrier.conf
blacklist ${HOME}/.config/Dharkael
blacklist ${HOME}/.config/ENCOM
blacklist ${HOME}/.config/Electron
blacklist ${HOME}/.config/Element
blacklist ${HOME}/.config/Element (Riot)
blacklist ${HOME}/.config/Enox
blacklist ${HOME}/.config/Epic
blacklist ${HOME}/.config/Exodus
blacklist ${HOME}/.config/Ferdi
blacklist ${HOME}/.config/Flavio Tordini
blacklist ${HOME}/.config/Franz
blacklist ${HOME}/.config/FreeCAD
blacklist ${HOME}/.config/FreeTube
blacklist ${HOME}/.config/Fritzing
blacklist ${HOME}/.config/GIMP
blacklist ${HOME}/.config/GitHub Desktop
blacklist ${HOME}/.config/Gitter
blacklist ${HOME}/.config/Google
blacklist ${HOME}/.config/Google Play Music Desktop Player
blacklist ${HOME}/.config/Gpredict
blacklist ${HOME}/.config/INRIA
blacklist ${HOME}/.config/InSilmaril
blacklist ${HOME}/.config/JetBrains/CLion*
blacklist ${HOME}/.config/JetBrains/PyCharm*
blacklist ${HOME}/.config/Jitsi Meet
blacklist ${HOME}/.config/KDE/neochat
blacklist ${HOME}/.config/KeePass
blacklist ${HOME}/.config/KeePassXCrc
blacklist ${HOME}/.config/Kid3
blacklist ${HOME}/.config/Kingsoft
blacklist ${HOME}/.config/Ledger Live
blacklist ${HOME}/.config/LibreCAD
blacklist ${HOME}/.config/Loop_Hero
blacklist ${HOME}/.config/Luminance
blacklist ${HOME}/.config/LyX
blacklist ${HOME}/.config/MangoHud
blacklist ${HOME}/.config/Mattermost
blacklist ${HOME}/.config/Meltytech
blacklist ${HOME}/.config/Mendeley Ltd.
blacklist ${HOME}/.config/Microsoft
blacklist ${HOME}/.config/Min
blacklist ${HOME}/.config/ModTheSpire
blacklist ${HOME}/.config/Mousepad
blacklist ${HOME}/.config/Mumble
blacklist ${HOME}/.config/MusE
blacklist ${HOME}/.config/MuseScore
blacklist ${HOME}/.config/MusicBrainz
blacklist ${HOME}/.config/Nathan Osman
blacklist ${HOME}/.config/Nextcloud
blacklist ${HOME}/.config/NitroShare
blacklist ${HOME}/.config/Notable
blacklist ${HOME}/.config/Nylas Mail
blacklist ${HOME}/.config/PBE
blacklist ${HOME}/.config/PacmanLogViewer
blacklist ${HOME}/.config/PawelStolowski
blacklist ${HOME}/.config/Philipp Schmieder
blacklist ${HOME}/.config/Pinta
blacklist ${HOME}/.config/QGIS
blacklist ${HOME}/.config/QMediathekView
blacklist ${HOME}/.config/QQ
blacklist ${HOME}/.config/Qlipper
blacklist ${HOME}/.config/QuiteRss
blacklist ${HOME}/.config/QuiteRssrc
blacklist ${HOME}/.config/Quotient
blacklist ${HOME}/.config/Rambox
blacklist ${HOME}/.config/Riot
blacklist ${HOME}/.config/Rocket.Chat
blacklist ${HOME}/.config/RogueLegacy
blacklist ${HOME}/.config/RogueLegacyStorageContainer
blacklist ${HOME}/.config/Seafile
blacklist ${HOME}/.config/Signal
blacklist ${HOME}/.config/Sinew Software Systems
blacklist ${HOME}/.config/Slack
blacklist ${HOME}/.config/Standard Notes
blacklist ${HOME}/.config/SubDownloader
blacklist ${HOME}/.config/Thunar
blacklist ${HOME}/.config/Twitch
blacklist ${HOME}/.config/Unknown Organization
blacklist ${HOME}/.config/VSCodium
blacklist ${HOME}/.config/VirtualBox
blacklist ${HOME}/.config/Whalebird
blacklist ${HOME}/.config/Wire
blacklist ${HOME}/.config/Youtube
blacklist ${HOME}/.config/ZeGrapher Project
blacklist ${HOME}/.config/Zeal
blacklist ${HOME}/.config/Zulip
blacklist ${HOME}/.config/aacs
blacklist ${HOME}/.config/abiword
blacklist ${HOME}/.config/agenda
blacklist ${HOME}/.config/akonadi*
blacklist ${HOME}/.config/akregatorrc
blacklist ${HOME}/.config/alacritty
blacklist ${HOME}/.config/ardour4
blacklist ${HOME}/.config/ardour5
blacklist ${HOME}/.config/aria2
blacklist ${HOME}/.config/arkrc
blacklist ${HOME}/.config/artha.conf
blacklist ${HOME}/.config/artha.log
blacklist ${HOME}/.config/asunder
blacklist ${HOME}/.config/atril
blacklist ${HOME}/.config/audacious
blacklist ${HOME}/.config/audacity
blacklist ${HOME}/.config/autokey
blacklist ${HOME}/.config/avidemux3_qt5rc
blacklist ${HOME}/.config/aweather
blacklist ${HOME}/.config/backintime
blacklist ${HOME}/.config/baloofilerc
blacklist ${HOME}/.config/baloorc
blacklist ${HOME}/.config/bcompare
blacklist ${HOME}/.config/blender
blacklist ${HOME}/.config/bless
blacklist ${HOME}/.config/bnox
blacklist ${HOME}/.config/borg
blacklist ${HOME}/.config/brasero
blacklist ${HOME}/.config/brave
blacklist ${HOME}/.config/brave-flags.conf
blacklist ${HOME}/.config/caja
blacklist ${HOME}/.config/calibre
blacklist ${HOME}/.config/cantata
blacklist ${HOME}/.config/catfish
blacklist ${HOME}/.config/cawbird
blacklist ${HOME}/.config/celluloid
blacklist ${HOME}/.config/cherrytree
blacklist ${HOME}/.config/chrome-beta-flags.conf
blacklist ${HOME}/.config/chrome-beta-flags.config
blacklist ${HOME}/.config/chrome-flags.conf
blacklist ${HOME}/.config/chrome-flags.config
blacklist ${HOME}/.config/chrome-unstable-flags.conf
blacklist ${HOME}/.config/chrome-unstable-flags.config
blacklist ${HOME}/.config/chromium
blacklist ${HOME}/.config/chromium-dev
blacklist ${HOME}/.config/chromium-flags.conf
blacklist ${HOME}/.config/clipit
blacklist ${HOME}/.config/cliqz
blacklist ${HOME}/.config/cmus
blacklist ${HOME}/.config/cointop
blacklist ${HOME}/.config/com.github.bleakgrey.tootle
blacklist ${HOME}/.config/corebird
blacklist ${HOME}/.config/cower
blacklist ${HOME}/.config/coyim
blacklist ${HOME}/.config/d-feet
blacklist ${HOME}/.config/darktable
blacklist ${HOME}/.config/deadbeef
blacklist ${HOME}/.config/deluge
blacklist ${HOME}/.config/devilspie2
blacklist ${HOME}/.config/digikam
blacklist ${HOME}/.config/digikamrc
blacklist ${HOME}/.config/discord
blacklist ${HOME}/.config/discordcanary
blacklist ${HOME}/.config/dkl
blacklist ${HOME}/.config/dnox
blacklist ${HOME}/.config/dolphin-emu
blacklist ${HOME}/.config/dolphinrc
blacklist ${HOME}/.config/dragonplayerrc
blacklist ${HOME}/.config/draw.io
blacklist ${HOME}/.config/electron*-flag*.conf
blacklist ${HOME}/.config/electron-mail
blacklist ${HOME}/.config/emaildefaults
blacklist ${HOME}/.config/emailidentities
blacklist ${HOME}/.config/emilia
blacklist ${HOME}/.config/enchant
blacklist ${HOME}/.config/eog
blacklist ${HOME}/.config/epiphany
blacklist ${HOME}/.config/equalx
blacklist ${HOME}/.config/evince
blacklist ${HOME}/.config/evolution
blacklist ${HOME}/.config/falkon
blacklist ${HOME}/.config/filezilla
blacklist ${HOME}/.config/flameshot
blacklist ${HOME}/.config/flaska.net
blacklist ${HOME}/.config/flowblade
blacklist ${HOME}/.config/font-manager
blacklist ${HOME}/.config/freecol
blacklist ${HOME}/.config/gajim
blacklist ${HOME}/.config/galculator
blacklist ${HOME}/.config/gallery-dl
blacklist ${HOME}/.config/gconf
blacklist ${HOME}/.config/gdfuse
blacklist ${HOME}/.config/geany
blacklist ${HOME}/.config/geary
blacklist ${HOME}/.config/gedit
blacklist ${HOME}/.config/geeqie
blacklist ${HOME}/.config/ghb
blacklist ${HOME}/.config/ghostwriter
blacklist ${HOME}/.config/git
blacklist ${HOME}/.config/git-cola
blacklist ${HOME}/.config/glade.conf
blacklist ${HOME}/.config/globaltime
blacklist ${HOME}/.config/gmpc
blacklist ${HOME}/.config/gnome-builder
blacklist ${HOME}/.config/gnome-chess
blacklist ${HOME}/.config/gnome-control-center
blacklist ${HOME}/.config/gnome-initial-setup-done
blacklist ${HOME}/.config/gnome-latex
blacklist ${HOME}/.config/gnome-mplayer
blacklist ${HOME}/.config/gnome-mpv
blacklist ${HOME}/.config/gnome-pie
blacklist ${HOME}/.config/gnome-session
blacklist ${HOME}/.config/gnote
blacklist ${HOME}/.config/godot
blacklist ${HOME}/.config/google-chrome
blacklist ${HOME}/.config/google-chrome-beta
blacklist ${HOME}/.config/google-chrome-unstable
blacklist ${HOME}/.config/gpicview
blacklist ${HOME}/.config/gthumb
blacklist ${HOME}/.config/gummi
blacklist ${HOME}/.config/guvcview2
blacklist ${HOME}/.config/gwenviewrc
blacklist ${HOME}/.config/hexchat
blacklist ${HOME}/.config/homebank
blacklist ${HOME}/.config/i2p
blacklist ${HOME}/.config/inkscape
blacklist ${HOME}/.config/inox
blacklist ${HOME}/.config/iridium
blacklist ${HOME}/.config/itch
blacklist ${HOME}/.config/jami
blacklist ${HOME}/.config/jd-gui.cfg
blacklist ${HOME}/.config/jgit
blacklist ${HOME}/.config/k3brc
blacklist ${HOME}/.config/kaffeinerc
blacklist ${HOME}/.config/kalgebrarc
blacklist ${HOME}/.config/katemetainfos
blacklist ${HOME}/.config/katepartrc
blacklist ${HOME}/.config/katerc
blacklist ${HOME}/.config/kateschemarc
blacklist ${HOME}/.config/katesyntaxhighlightingrc
blacklist ${HOME}/.config/katevirc
blacklist ${HOME}/.config/kazam
blacklist ${HOME}/.config/kdeconnect
blacklist ${HOME}/.config/kdenliverc
blacklist ${HOME}/.config/kdiff3fileitemactionrc
blacklist ${HOME}/.config/kdiff3rc
blacklist ${HOME}/.config/keepass
blacklist ${HOME}/.config/keepassx
blacklist ${HOME}/.config/keepassxc
blacklist ${HOME}/.config/kfindrc
blacklist ${HOME}/.config/kgetrc
blacklist ${HOME}/.config/kid3rc
blacklist ${HOME}/.config/klavaro
blacklist ${HOME}/.config/klipperrc
blacklist ${HOME}/.config/kmail2rc
blacklist ${HOME}/.config/kmailsearchindexingrc
blacklist ${HOME}/.config/kmplayerrc
blacklist ${HOME}/.config/knotesrc
blacklist ${HOME}/.config/konversation.notifyrc
blacklist ${HOME}/.config/konversationrc
blacklist ${HOME}/.config/kritarc
blacklist ${HOME}/.config/ktorrentrc
blacklist ${HOME}/.config/ktouch2rc
blacklist ${HOME}/.config/kube
blacklist ${HOME}/.config/kwriterc
blacklist ${HOME}/.config/lbry-viewer
blacklist ${HOME}/.config/leafpad
blacklist ${HOME}/.config/libreoffice
blacklist ${HOME}/.config/liferea
blacklist ${HOME}/.config/linphone
blacklist ${HOME}/.config/lugaru
blacklist ${HOME}/.config/lutris
blacklist ${HOME}/.config/lximage-qt
blacklist ${HOME}/.config/mailtransports
blacklist ${HOME}/.config/mana
blacklist ${HOME}/.config/mate-calc
blacklist ${HOME}/.config/mate/eom
blacklist ${HOME}/.config/mate/mate-dictionary
blacklist ${HOME}/.config/matrix-mirage
blacklist ${HOME}/.config/mcomix
blacklist ${HOME}/.config/meld
blacklist ${HOME}/.config/menulibre.cfg
blacklist ${HOME}/.config/meteo-qt
blacklist ${HOME}/.config/mfusion
blacklist ${HOME}/.config/microsoft-edge
blacklist ${HOME}/.config/microsoft-edge-beta
blacklist ${HOME}/.config/microsoft-edge-dev
blacklist ${HOME}/.config/midori
blacklist ${HOME}/.config/mirage
blacklist ${HOME}/.config/monero-project
blacklist ${HOME}/.config/mono
blacklist ${HOME}/.config/mpDris2
blacklist ${HOME}/.config/mpd
blacklist ${HOME}/.config/mps-youtube
blacklist ${HOME}/.config/mpv
blacklist ${HOME}/.config/mupen64plus
blacklist ${HOME}/.config/mutt
blacklist ${HOME}/.config/mutter
blacklist ${HOME}/.config/mypaint
blacklist ${HOME}/.config/nano
blacklist ${HOME}/.config/nautilus
blacklist ${HOME}/.config/nemo
blacklist ${HOME}/.config/neochat.notifyrc
blacklist ${HOME}/.config/neochatrc
blacklist ${HOME}/.config/neomutt
blacklist ${HOME}/.config/netsurf
blacklist ${HOME}/.config/newsbeuter
blacklist ${HOME}/.config/newsboat
blacklist ${HOME}/.config/newsflash
blacklist ${HOME}/.config/nheko
blacklist ${HOME}/.config/nomacs
blacklist ${HOME}/.config/nuclear
blacklist ${HOME}/.config/nvim
blacklist ${HOME}/.config/obs-studio
blacklist ${HOME}/.config/okularpartrc
blacklist ${HOME}/.config/okularrc
blacklist ${HOME}/.config/onboard
blacklist ${HOME}/.config/onionshare
blacklist ${HOME}/.config/onlyoffice
blacklist ${HOME}/.config/openmw
blacklist ${HOME}/.config/opera
blacklist ${HOME}/.config/opera-beta
blacklist ${HOME}/.config/opera-developer
blacklist ${HOME}/.config/orage
blacklist ${HOME}/.config/org.gabmus.gfeeds.json
blacklist ${HOME}/.config/org.gabmus.gfeeds.saved_articles
blacklist ${HOME}/.config/org.kde.gwenviewrc
blacklist ${HOME}/.config/otter
blacklist ${HOME}/.config/pavucontrol-qt
blacklist ${HOME}/.config/pavucontrol.ini
blacklist ${HOME}/.config/pcmanfm
blacklist ${HOME}/.config/pdfmod
blacklist ${HOME}/.config/pipe-viewer
blacklist ${HOME}/.config/pitivi
blacklist ${HOME}/.config/pix
blacklist ${HOME}/.config/pluma
blacklist ${HOME}/.config/ppsspp
blacklist ${HOME}/.config/pragha
blacklist ${HOME}/.config/profanity
blacklist ${HOME}/.config/psi
blacklist ${HOME}/.config/psi+
blacklist ${HOME}/.config/qBittorrent
blacklist ${HOME}/.config/qBittorrentrc
blacklist ${HOME}/.config/qnapi.ini
blacklist ${HOME}/.config/qpdfview
blacklist ${HOME}/.config/quodlibet
blacklist ${HOME}/.config/qupzilla
blacklist ${HOME}/.config/qutebrowser
blacklist ${HOME}/.config/ranger
blacklist ${HOME}/.config/rclone
blacklist ${HOME}/.config/redshift
blacklist ${HOME}/.config/redshift.conf
blacklist ${HOME}/.config/remmina
blacklist ${HOME}/.config/ristretto
blacklist ${HOME}/.config/rpcs3
blacklist ${HOME}/.config/rtv
blacklist ${HOME}/.config/scribus
blacklist ${HOME}/.config/scribusrc
blacklist ${HOME}/.config/sinew.in
blacklist ${HOME}/.config/sink
blacklist ${HOME}/.config/skypeforlinux
blacklist ${HOME}/.config/slimjet
blacklist ${HOME}/.config/smplayer
blacklist ${HOME}/.config/smtube
blacklist ${HOME}/.config/smuxi
blacklist ${HOME}/.config/snox
blacklist ${HOME}/.config/sound-juicer
blacklist ${HOME}/.config/specialmailcollectionsrc
blacklist ${HOME}/.config/spectaclerc
blacklist ${HOME}/.config/spotify
blacklist ${HOME}/.config/spotify-adblock
blacklist ${HOME}/.config/sqlitebrowser
blacklist ${HOME}/.config/stellarium
blacklist ${HOME}/.config/straw-viewer
blacklist ${HOME}/.config/strawberry
blacklist ${HOME}/.config/supertuxkart
blacklist ${HOME}/.config/synfig
blacklist ${HOME}/.config/teams
blacklist ${HOME}/.config/teams-for-linux
blacklist ${HOME}/.config/telepathy-account-widgets
blacklist ${HOME}/.config/torbrowser
blacklist ${HOME}/.config/totem
blacklist ${HOME}/.config/tox
blacklist ${HOME}/.config/transgui
blacklist ${HOME}/.config/transmission
blacklist ${HOME}/.config/truecraft
blacklist ${HOME}/.config/tuir
blacklist ${HOME}/.config/tuta_integration
blacklist ${HOME}/.config/tutanota-desktop
blacklist ${HOME}/.config/tvbrowser
blacklist ${HOME}/.config/uGet
blacklist ${HOME}/.config/ungoogled-chromium
blacklist ${HOME}/.config/uzbl
blacklist ${HOME}/.config/viewnior
blacklist ${HOME}/.config/vivaldi
blacklist ${HOME}/.config/vivaldi-snapshot
blacklist ${HOME}/.config/vlc
blacklist ${HOME}/.config/wesnoth
blacklist ${HOME}/.config/wget
blacklist ${HOME}/.config/wireshark
blacklist ${HOME}/.config/wormux
blacklist ${HOME}/.config/xchat
blacklist ${HOME}/.config/xed
blacklist ${HOME}/.config/xfburn
blacklist ${HOME}/.config/xfce4-dict
blacklist ${HOME}/.config/xfce4/xfce4-notes.gtkrc
blacklist ${HOME}/.config/xfce4/xfce4-notes.rc
blacklist ${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml
blacklist ${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-mixer.xml
blacklist ${HOME}/.config/xiaoyong
blacklist ${HOME}/.config/xmms2
blacklist ${HOME}/.config/xournalpp
blacklist ${HOME}/.config/xplayer
blacklist ${HOME}/.config/xreader
blacklist ${HOME}/.config/xviewer
blacklist ${HOME}/.config/yandex-browser
blacklist ${HOME}/.config/yandex-browser-beta
blacklist ${HOME}/.config/yelp
blacklist ${HOME}/.config/youtube-dl
blacklist ${HOME}/.config/youtube-dlg
blacklist ${HOME}/.config/youtube-music-desktop-app
blacklist ${HOME}/.config/youtube-viewer
blacklist ${HOME}/.config/youtubemusic-nativefier-040164
blacklist ${HOME}/.config/yt-dlp
blacklist ${HOME}/.config/yt-dlp.conf
blacklist ${HOME}/.config/zathura
blacklist ${HOME}/.config/zim
blacklist ${HOME}/.config/zoomus.conf
blacklist ${HOME}/.conkeror.mozdev.org
blacklist ${HOME}/.crawl
blacklist ${HOME}/.cups
blacklist ${HOME}/.curl-hsts
blacklist ${HOME}/.curlrc
blacklist ${HOME}/.dashcore
blacklist ${HOME}/.devilspie
blacklist ${HOME}/.dia
blacklist ${HOME}/.digrc
blacklist ${HOME}/.dillo
blacklist ${HOME}/.dooble
blacklist ${HOME}/.dosbox
blacklist ${HOME}/.dropbox*
blacklist ${HOME}/.easystroke
blacklist ${HOME}/.electron-cache
blacklist ${HOME}/.electrum*
blacklist ${HOME}/.elinks
blacklist ${HOME}/.emacs
blacklist ${HOME}/.emacs.d
blacklist ${HOME}/.equalx
blacklist ${HOME}/.ethereum
blacklist ${HOME}/.etr
blacklist ${HOME}/.filezilla
blacklist ${HOME}/.firedragon
blacklist ${HOME}/.flowblade
blacklist ${HOME}/.fltk
blacklist ${HOME}/.fossamail
blacklist ${HOME}/.fpm
blacklist ${HOME}/.freeciv
blacklist ${HOME}/.freecol
blacklist ${HOME}/.freemind
blacklist ${HOME}/.frogatto
blacklist ${HOME}/.frozen-bubble
blacklist ${HOME}/.funnyboat
blacklist ${HOME}/.g8
blacklist ${HOME}/.gallery-dl.conf
blacklist ${HOME}/.gdfuse
blacklist ${HOME}/.geekbench5
blacklist ${HOME}/.gimp*
blacklist ${HOME}/.gist
blacklist ${HOME}/.gitconfig
blacklist ${HOME}/.gl-117
blacklist ${HOME}/.glaxiumrc
blacklist ${HOME}/.gnome/gnome-schedule
blacklist ${HOME}/.goldendict
blacklist ${HOME}/.googleearth
blacklist ${HOME}/.gradle
blacklist ${HOME}/.gramps
blacklist ${HOME}/.guayadeque
blacklist ${HOME}/.hashcat
blacklist ${HOME}/.hedgewars
blacklist ${HOME}/.hex-a-hop
blacklist ${HOME}/.hugin
blacklist ${HOME}/.i2p
blacklist ${HOME}/.icedove
blacklist ${HOME}/.imagej
blacklist ${HOME}/.inkscape
blacklist ${HOME}/.itch
blacklist ${HOME}/.ivy2
blacklist ${HOME}/.jack-server
blacklist ${HOME}/.jack-settings
blacklist ${HOME}/.jak
blacklist ${HOME}/.java
blacklist ${HOME}/.jd
blacklist ${HOME}/.jitsi
blacklist ${HOME}/.jumpnbump
blacklist ${HOME}/.kde/share/apps/digikam
blacklist ${HOME}/.kde/share/apps/gwenview
blacklist ${HOME}/.kde/share/apps/kaffeine
blacklist ${HOME}/.kde/share/apps/kcookiejar
blacklist ${HOME}/.kde/share/apps/kget
blacklist ${HOME}/.kde/share/apps/khtml
blacklist ${HOME}/.kde/share/apps/klatexformula
blacklist ${HOME}/.kde/share/apps/konqsidebartng
blacklist ${HOME}/.kde/share/apps/konqueror
blacklist ${HOME}/.kde/share/apps/kopete
blacklist ${HOME}/.kde/share/apps/ktorrent
blacklist ${HOME}/.kde/share/apps/okular
blacklist ${HOME}/.kde/share/config/baloofilerc
blacklist ${HOME}/.kde/share/config/baloorc
blacklist ${HOME}/.kde/share/config/digikam
blacklist ${HOME}/.kde/share/config/gwenviewrc
blacklist ${HOME}/.kde/share/config/k3brc
blacklist ${HOME}/.kde/share/config/kaffeinerc
blacklist ${HOME}/.kde/share/config/kcookiejarrc
blacklist ${HOME}/.kde/share/config/kfindrc
blacklist ${HOME}/.kde/share/config/kgetrc
blacklist ${HOME}/.kde/share/config/khtmlrc
blacklist ${HOME}/.kde/share/config/klipperrc
blacklist ${HOME}/.kde/share/config/kmplayerrc
blacklist ${HOME}/.kde/share/config/konq_history
blacklist ${HOME}/.kde/share/config/konqsidebartngrc
blacklist ${HOME}/.kde/share/config/konquerorrc
blacklist ${HOME}/.kde/share/config/konversationrc
blacklist ${HOME}/.kde/share/config/kopeterc
blacklist ${HOME}/.kde/share/config/ktorrentrc
blacklist ${HOME}/.kde/share/config/okularpartrc
blacklist ${HOME}/.kde/share/config/okularrc
blacklist ${HOME}/.kde4/share/apps/digikam
blacklist ${HOME}/.kde4/share/apps/gwenview
blacklist ${HOME}/.kde4/share/apps/kaffeine
blacklist ${HOME}/.kde4/share/apps/kcookiejar
blacklist ${HOME}/.kde4/share/apps/kget
blacklist ${HOME}/.kde4/share/apps/khtml
blacklist ${HOME}/.kde4/share/apps/konqsidebartng
blacklist ${HOME}/.kde4/share/apps/konqueror
blacklist ${HOME}/.kde4/share/apps/kopete
blacklist ${HOME}/.kde4/share/apps/ktorrent
blacklist ${HOME}/.kde4/share/apps/okular
blacklist ${HOME}/.kde4/share/config/baloofilerc
blacklist ${HOME}/.kde4/share/config/baloorc
blacklist ${HOME}/.kde4/share/config/digikam
blacklist ${HOME}/.kde4/share/config/gwenviewrc
blacklist ${HOME}/.kde4/share/config/k3brc
blacklist ${HOME}/.kde4/share/config/kaffeinerc
blacklist ${HOME}/.kde4/share/config/kcookiejarrc
blacklist ${HOME}/.kde4/share/config/kfindrc
blacklist ${HOME}/.kde4/share/config/kgetrc
blacklist ${HOME}/.kde4/share/config/khtmlrc
blacklist ${HOME}/.kde4/share/config/klipperrc
blacklist ${HOME}/.kde4/share/config/konq_history
blacklist ${HOME}/.kde4/share/config/konqsidebartngrc
blacklist ${HOME}/.kde4/share/config/konquerorrc
blacklist ${HOME}/.kde4/share/config/konversationrc
blacklist ${HOME}/.kde4/share/config/kopeterc
blacklist ${HOME}/.kde4/share/config/ktorrentrc
blacklist ${HOME}/.kde4/share/config/okularpartrc
blacklist ${HOME}/.kde4/share/config/okularrc
blacklist ${HOME}/.keepass
blacklist ${HOME}/.keepassx
blacklist ${HOME}/.keepassxc
blacklist ${HOME}/.killingfloor
blacklist ${HOME}/.kingsoft
blacklist ${HOME}/.kino-history
blacklist ${HOME}/.kinorc
blacklist ${HOME}/.klatexformula
blacklist ${HOME}/.klei
blacklist ${HOME}/.kodi
blacklist ${HOME}/.lastpass
blacklist ${HOME}/.librewolf
blacklist ${HOME}/.lincity-ng
blacklist ${HOME}/.links
blacklist ${HOME}/.links2
blacklist ${HOME}/.linphone-history.db
blacklist ${HOME}/.linphonerc
blacklist ${HOME}/.lmmsrc.xml
blacklist ${HOME}/.local/lib/vivaldi
blacklist ${HOME}/.local/share/0ad
blacklist ${HOME}/.local/share/3909/PapersPlease
blacklist ${HOME}/.local/share/Anki2
blacklist ${HOME}/.local/share/Colossal Order
blacklist ${HOME}/.local/share/Dredmor
blacklist ${HOME}/.local/share/Empathy
blacklist ${HOME}/.local/share/Enpass
blacklist ${HOME}/.local/share/FasterThanLight
blacklist ${HOME}/.local/share/Flavio Tordini
blacklist ${HOME}/.local/share/HotlineMiami
blacklist ${HOME}/.local/share/IntoTheBreach
blacklist ${HOME}/.local/share/JetBrains
blacklist ${HOME}/.local/share/KDE/neochat
blacklist ${HOME}/.local/share/KeePass
blacklist ${HOME}/.local/share/Kingsoft
blacklist ${HOME}/.local/share/LibreCAD
blacklist ${HOME}/.local/share/Mendeley Ltd.
blacklist ${HOME}/.local/share/Mumble
blacklist ${HOME}/.local/share/Nextcloud
blacklist ${HOME}/.local/share/PBE
blacklist ${HOME}/.local/share/Paradox Interactive
blacklist ${HOME}/.local/share/PawelStolowski
blacklist ${HOME}/.local/share/PillarsOfEternity
blacklist ${HOME}/.local/share/Psi
blacklist ${HOME}/.local/share/QGIS
blacklist ${HOME}/.local/share/QMediathekView
blacklist ${HOME}/.local/share/QuiteRss
blacklist ${HOME}/.local/share/Ricochet
blacklist ${HOME}/.local/share/RogueLegacy
blacklist ${HOME}/.local/share/RogueLegacyStorageContainer
blacklist ${HOME}/.local/share/Shortwave
blacklist ${HOME}/.local/share/SongRec
blacklist ${HOME}/.local/share/Steam
blacklist ${HOME}/.local/share/SteamWorld Dig 2
blacklist ${HOME}/.local/share/SteamWorldDig
blacklist ${HOME}/.local/share/SuperHexagon
blacklist ${HOME}/.local/share/TelegramDesktop
blacklist ${HOME}/.local/share/Terraria
blacklist ${HOME}/.local/share/TpLogger
blacklist ${HOME}/.local/share/Zeal
blacklist ${HOME}/.local/share/agenda
blacklist ${HOME}/.local/share/akonadi*
blacklist ${HOME}/.local/share/akregator
blacklist ${HOME}/.local/share/apps/korganizer
blacklist ${HOME}/.local/share/aspyr-media
blacklist ${HOME}/.local/share/audacity
blacklist ${HOME}/.local/share/authenticator-rs
blacklist ${HOME}/.local/share/autokey
blacklist ${HOME}/.local/share/backintime
blacklist ${HOME}/.local/share/baloo
blacklist ${HOME}/.local/share/barrier
blacklist ${HOME}/.local/share/bibletime
blacklist ${HOME}/.local/share/bijiben
blacklist ${HOME}/.local/share/bohemiainteractive
blacklist ${HOME}/.local/share/caja-python
blacklist ${HOME}/.local/share/calligragemini
blacklist ${HOME}/.local/share/cantata
blacklist ${HOME}/.local/share/cdprojektred
blacklist ${HOME}/.local/share/chatterino
blacklist ${HOME}/.local/share/clipit
blacklist ${HOME}/.local/share/com.github.johnfactotum.Foliate
blacklist ${HOME}/.local/share/contacts
blacklist ${HOME}/.local/share/cor-games
blacklist ${HOME}/.local/share/data/Mendeley Ltd.
blacklist ${HOME}/.local/share/data/Mumble
blacklist ${HOME}/.local/share/data/MusE
blacklist ${HOME}/.local/share/data/MuseScore
blacklist ${HOME}/.local/share/data/nomacs
blacklist ${HOME}/.local/share/data/qBittorrent
blacklist ${HOME}/.local/share/dino
blacklist ${HOME}/.local/share/dolphin
blacklist ${HOME}/.local/share/dolphin-emu
blacklist ${HOME}/.local/share/emailidentities
blacklist ${HOME}/.local/share/epiphany
blacklist ${HOME}/.local/share/evolution
blacklist ${HOME}/.local/share/feedreader
blacklist ${HOME}/.local/share/feral-interactive
blacklist ${HOME}/.local/share/five-or-more
blacklist ${HOME}/.local/share/freecol
blacklist ${HOME}/.local/share/gajim
blacklist ${HOME}/.local/share/gdfuse
blacklist ${HOME}/.local/share/geary
blacklist ${HOME}/.local/share/geeqie
blacklist ${HOME}/.local/share/ghostwriter
blacklist ${HOME}/.local/share/gitg
blacklist ${HOME}/.local/share/gnome-2048
blacklist ${HOME}/.local/share/gnome-boxes
blacklist ${HOME}/.local/share/gnome-builder
blacklist ${HOME}/.local/share/gnome-chess
blacklist ${HOME}/.local/share/gnome-klotski
blacklist ${HOME}/.local/share/gnome-latex
blacklist ${HOME}/.local/share/gnome-mines
blacklist ${HOME}/.local/share/gnome-music
blacklist ${HOME}/.local/share/gnome-nibbles
blacklist ${HOME}/.local/share/gnome-photos
blacklist ${HOME}/.local/share/gnome-pomodoro
blacklist ${HOME}/.local/share/gnome-recipes
blacklist ${HOME}/.local/share/gnome-ring
blacklist ${HOME}/.local/share/gnome-sudoku
blacklist ${HOME}/.local/share/gnome-twitch
blacklist ${HOME}/.local/share/gnote
blacklist ${HOME}/.local/share/godot
blacklist ${HOME}/.local/share/gradio
blacklist ${HOME}/.local/share/gwenview
blacklist ${HOME}/.local/share/i2p
blacklist ${HOME}/.local/share/io.github.lainsce.Notejot
blacklist ${HOME}/.local/share/jami
blacklist ${HOME}/.local/share/kaffeine
blacklist ${HOME}/.local/share/kalgebra
blacklist ${HOME}/.local/share/kate
blacklist ${HOME}/.local/share/kdenlive
blacklist ${HOME}/.local/share/keepass
blacklist ${HOME}/.local/share/kget
blacklist ${HOME}/.local/share/kiwix
blacklist ${HOME}/.local/share/kiwix-desktop
blacklist ${HOME}/.local/share/klavaro
blacklist ${HOME}/.local/share/kmail2
blacklist ${HOME}/.local/share/kmplayer
blacklist ${HOME}/.local/share/knotes
blacklist ${HOME}/.local/share/krita
blacklist ${HOME}/.local/share/ktorrent
blacklist ${HOME}/.local/share/ktorrentrc
blacklist ${HOME}/.local/share/ktouch
blacklist ${HOME}/.local/share/kube
blacklist ${HOME}/.local/share/kwrite
blacklist ${HOME}/.local/share/kxmlgui5/*
blacklist ${HOME}/.local/share/liferea
blacklist ${HOME}/.local/share/linphone
blacklist ${HOME}/.local/share/local-mail
blacklist ${HOME}/.local/share/lollypop
blacklist ${HOME}/.local/share/love
blacklist ${HOME}/.local/share/lugaru
blacklist ${HOME}/.local/share/lutris
blacklist ${HOME}/.local/share/man
blacklist ${HOME}/.local/share/mana
blacklist ${HOME}/.local/share/maps-places.json
blacklist ${HOME}/.local/share/matrix-mirage
blacklist ${HOME}/.local/share/mcomix
blacklist ${HOME}/.local/share/meld
blacklist ${HOME}/.local/share/midori
blacklist ${HOME}/.local/share/minder
blacklist ${HOME}/.local/share/mirage
blacklist ${HOME}/.local/share/multimc
blacklist ${HOME}/.local/share/multimc5
blacklist ${HOME}/.local/share/mupen64plus
blacklist ${HOME}/.local/share/mypaint
blacklist ${HOME}/.local/share/nautilus
blacklist ${HOME}/.local/share/nautilus-python
blacklist ${HOME}/.local/share/nemo
blacklist ${HOME}/.local/share/nemo-python
blacklist ${HOME}/.local/share/news-flash
blacklist ${HOME}/.local/share/newsbeuter
blacklist ${HOME}/.local/share/newsboat
blacklist ${HOME}/.local/share/nheko
blacklist ${HOME}/.local/share/nomacs
blacklist ${HOME}/.local/share/notes
blacklist ${HOME}/.local/share/ocenaudio
blacklist ${HOME}/.local/share/okular
blacklist ${HOME}/.local/share/onlyoffice
blacklist ${HOME}/.local/share/openmw
blacklist ${HOME}/.local/share/orage
blacklist ${HOME}/.local/share/org.kde.gwenview
blacklist ${HOME}/.local/share/pix
blacklist ${HOME}/.local/share/plasma_notes
blacklist ${HOME}/.local/share/profanity
blacklist ${HOME}/.local/share/psi
blacklist ${HOME}/.local/share/psi+
blacklist ${HOME}/.local/share/qBittorrent
blacklist ${HOME}/.local/share/qpdfview
blacklist ${HOME}/.local/share/quadrapassel
blacklist ${HOME}/.local/share/qutebrowser
blacklist ${HOME}/.local/share/remmina
blacklist ${HOME}/.local/share/rhythmbox
blacklist ${HOME}/.local/share/rtv
blacklist ${HOME}/.local/share/scribus
blacklist ${HOME}/.local/share/shotwell
blacklist ${HOME}/.local/share/signal-cli
blacklist ${HOME}/.local/share/sink
blacklist ${HOME}/.local/share/smuxi
blacklist ${HOME}/.local/share/spotify
blacklist ${HOME}/.local/share/steam
blacklist ${HOME}/.local/share/strawberry
blacklist ${HOME}/.local/share/supertux2
blacklist ${HOME}/.local/share/supertuxkart
blacklist ${HOME}/.local/share/swell-foop
blacklist ${HOME}/.local/share/telepathy
blacklist ${HOME}/.local/share/terasology
blacklist ${HOME}/.local/share/torbrowser
blacklist ${HOME}/.local/share/totem
blacklist ${HOME}/.local/share/tuir
blacklist ${HOME}/.local/share/uzbl
blacklist ${HOME}/.local/share/vlc
blacklist ${HOME}/.local/share/vpltd
blacklist ${HOME}/.local/share/vulkan
blacklist ${HOME}/.local/share/warsow-2.1
blacklist ${HOME}/.local/share/warzone2100-3.*
blacklist ${HOME}/.local/share/wesnoth
blacklist ${HOME}/.local/share/wget
blacklist ${HOME}/.local/share/wormux
blacklist ${HOME}/.local/share/xplayer
blacklist ${HOME}/.local/share/xreader
blacklist ${HOME}/.local/share/zathura
blacklist ${HOME}/.local/state/audacity
blacklist ${HOME}/.local/state/pipewire
blacklist ${HOME}/.lv2
blacklist ${HOME}/.lyx
blacklist ${HOME}/.magicor
blacklist ${HOME}/.masterpdfeditor
blacklist ${HOME}/.mbwarband
blacklist ${HOME}/.mcabber
blacklist ${HOME}/.mcabberrc
blacklist ${HOME}/.mediathek3
blacklist ${HOME}/.megaglest
blacklist ${HOME}/.minecraft
blacklist ${HOME}/.minetest
blacklist ${HOME}/.mirrormagic
blacklist ${HOME}/.moc
blacklist ${HOME}/.moonchild productions/basilisk
blacklist ${HOME}/.moonchild productions/pale moon
blacklist ${HOME}/.mozilla
blacklist ${HOME}/.mp3splt-gtk
blacklist ${HOME}/.mpd
blacklist ${HOME}/.mpdconf
blacklist ${HOME}/.mplayer
blacklist ${HOME}/.msmtprc
blacklist ${HOME}/.multimc5
blacklist ${HOME}/.nanorc
blacklist ${HOME}/.netactview
blacklist ${HOME}/.neverball
blacklist ${HOME}/.newsbeuter
blacklist ${HOME}/.newsboat
blacklist ${HOME}/.newsrc
blacklist ${HOME}/.nicotine
blacklist ${HOME}/.node-gyp
blacklist ${HOME}/.notable
blacklist ${HOME}/.npm
blacklist ${HOME}/.npmrc
blacklist ${HOME}/.nv
blacklist ${HOME}/.nvm
blacklist ${HOME}/.nylas-mail
blacklist ${HOME}/.openarena
blacklist ${HOME}/.opencity
blacklist ${HOME}/.openinvaders
blacklist ${HOME}/.openshot
blacklist ${HOME}/.openshot_qt
blacklist ${HOME}/.openttd
blacklist ${HOME}/.opera
blacklist ${HOME}/.opera-beta
blacklist ${HOME}/.opera-developer
blacklist ${HOME}/.ostrichriders
blacklist ${HOME}/.paradoxinteractive
blacklist ${HOME}/.paradoxlauncher
blacklist ${HOME}/.parallelrealities/blobwars
blacklist ${HOME}/.pcsxr
blacklist ${HOME}/.penguin-command
blacklist ${HOME}/.pine-crash
blacklist ${HOME}/.pine-debug1
blacklist ${HOME}/.pine-debug2
blacklist ${HOME}/.pine-debug3
blacklist ${HOME}/.pine-debug4
blacklist ${HOME}/.pine-interrupted-mail
blacklist ${HOME}/.pinerc
blacklist ${HOME}/.pinercex
blacklist ${HOME}/.pingus
blacklist ${HOME}/.pioneer
blacklist ${HOME}/.prey
blacklist ${HOME}/.purple
blacklist ${HOME}/.pylint.d
blacklist ${HOME}/.qemu-launcher
blacklist ${HOME}/.qgis2
blacklist ${HOME}/.qmmp
blacklist ${HOME}/.quodlibet
blacklist ${HOME}/.redeclipse
blacklist ${HOME}/.rednotebook
blacklist ${HOME}/.remmina
blacklist ${HOME}/.repo_.gitconfig.json
blacklist ${HOME}/.repoconfig
blacklist ${HOME}/.retroshare
blacklist ${HOME}/.ripperXrc
blacklist ${HOME}/.sbt
blacklist ${HOME}/.scorched3d
blacklist ${HOME}/.scribus
blacklist ${HOME}/.scribusrc
blacklist ${HOME}/.simutrans
blacklist ${HOME}/.smartgit/*/passwords
blacklist ${HOME}/.ssr
blacklist ${HOME}/.steam
blacklist ${HOME}/.steampath
blacklist ${HOME}/.steampid
blacklist ${HOME}/.stellarium
blacklist ${HOME}/.subversion
blacklist ${HOME}/.surf
blacklist ${HOME}/.suve/colorful
blacklist ${HOME}/.swb.ini
blacklist ${HOME}/.sword
blacklist ${HOME}/.sylpheed-2.0
blacklist ${HOME}/.synfig
blacklist ${HOME}/.tb
blacklist ${HOME}/.tconn
blacklist ${HOME}/.teeworlds
blacklist ${HOME}/.texlive20*
blacklist ${HOME}/.thunderbird
blacklist ${HOME}/.tilp
blacklist ${HOME}/.tin
blacklist ${HOME}/.tooling
blacklist ${HOME}/.tor-browser*
blacklist ${HOME}/.torcs
blacklist ${HOME}/.tremulous
blacklist ${HOME}/.ts3client
blacklist ${HOME}/.tuxguitar*
blacklist ${HOME}/.tvbrowser
blacklist ${HOME}/.unknown-horizons
blacklist ${HOME}/.viking
blacklist ${HOME}/.viking-maps
blacklist ${HOME}/.vim
blacklist ${HOME}/.vimrc
blacklist ${HOME}/.vmware
blacklist ${HOME}/.vscode
blacklist ${HOME}/.vscode-oss
blacklist ${HOME}/.vst
blacklist ${HOME}/.vultures
blacklist ${HOME}/.w3m
blacklist ${HOME}/.warzone2100-3.*
blacklist ${HOME}/.waterfox
blacklist ${HOME}/.weechat
blacklist ${HOME}/.wget-hsts
blacklist ${HOME}/.wgetrc
blacklist ${HOME}/.widelands
blacklist ${HOME}/.wine
blacklist ${HOME}/.wine64
blacklist ${HOME}/.wireshark
blacklist ${HOME}/.wordwarvi
blacklist ${HOME}/.wormux
blacklist ${HOME}/.xiphos
blacklist ${HOME}/.xmind
blacklist ${HOME}/.xmms
blacklist ${HOME}/.xmr-stak
blacklist ${HOME}/.xonotic
blacklist ${HOME}/.xournalpp
blacklist ${HOME}/.xpdfrc
blacklist ${HOME}/.yarn
blacklist ${HOME}/.yarn-config
blacklist ${HOME}/.yarncache
blacklist ${HOME}/.yarnrc
blacklist ${HOME}/.zoom
blacklist ${HOME}/Applications # used for storing AppImages
blacklist ${HOME}/Arduino
blacklist ${HOME}/Monero/wallets
blacklist ${HOME}/Nextcloud
blacklist ${HOME}/Nextcloud/Notes
blacklist ${HOME}/Seafile/.seafile-data
blacklist ${HOME}/SoftMaker
blacklist ${HOME}/Standard Notes Backups
blacklist ${HOME}/TeamSpeak3-Client-linux_amd64
blacklist ${HOME}/TeamSpeak3-Client-linux_x86
blacklist ${HOME}/hyperrogue.ini
blacklist ${HOME}/i2p
blacklist ${HOME}/mps
blacklist ${HOME}/openstego.ini
blacklist ${HOME}/wallet.dat
blacklist ${HOME}/yt-dlp.conf
blacklist ${HOME}/yt-dlp.conf.txt
blacklist ${RUNUSER}/*firefox*
blacklist ${RUNUSER}/akonadi
blacklist ${RUNUSER}/psd/*firefox*
blacklist /etc/ssmtp
blacklist /tmp/.wine-*
blacklist /tmp/akonadi-*
blacklist /var/games/nethack
blacklist /var/games/slashem
blacklist /var/games/vulturesclaw
blacklist /var/games/vultureseye
blacklist /var/lib/games/Maelstrom-Scores
#endregion: @bundler [/etc/firejail/disable-programs.inc] END
#region: @bundler [/etc/firejail/disable-xdg.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

blacklist ${DOCUMENTS}
blacklist ${MUSIC}
blacklist ${PICTURES}
blacklist ${VIDEOS}

# The following should be considered catch-all directories
#blacklist ${DESKTOP}
#blacklist ${DOWNLOADS}
#endregion: @bundler [/etc/firejail/disable-xdg.inc] END

mkdir ${HOME}/.local/share/pki
mkdir ${HOME}/.pki
whitelist ${DOWNLOADS}
whitelist ${HOME}/.local/share/pki
whitelist ${HOME}/.pki
whitelist /usr/share/mozilla/extensions
whitelist /usr/share/webext
#region: @bundler [/etc/firejail/whitelist-common.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

# common whitelist for all profiles

whitelist ${HOME}/.XCompose
whitelist ${HOME}/.alsaequal.bin
whitelist ${HOME}/.asoundrc
whitelist ${HOME}/.config/ibus
whitelist ${HOME}/.config/mimeapps.list
whitelist ${HOME}/.config/pkcs11
read-only ${HOME}/.config/pkcs11
whitelist ${HOME}/.config/user-dirs.dirs
read-only ${HOME}/.config/user-dirs.dirs
whitelist ${HOME}/.config/user-dirs.locale
read-only ${HOME}/.config/user-dirs.locale
whitelist ${HOME}/.drirc
whitelist ${HOME}/.icons
?HAS_APPIMAGE: whitelist ${HOME}/.local/share/appimagekit
whitelist ${HOME}/.local/share/applications
read-only ${HOME}/.local/share/applications
whitelist ${HOME}/.local/share/icons
whitelist ${HOME}/.local/share/mime
whitelist ${HOME}/.mime.types
whitelist ${HOME}/.sndio/cookie
whitelist ${HOME}/.uim.d

# dconf
mkdir ${HOME}/.config/dconf
whitelist ${HOME}/.config/dconf

# fonts
whitelist ${HOME}/.cache/fontconfig
whitelist ${HOME}/.config/fontconfig
whitelist ${HOME}/.fontconfig
whitelist ${HOME}/.fonts
whitelist ${HOME}/.fonts.conf
whitelist ${HOME}/.fonts.conf.d
whitelist ${HOME}/.fonts.d
whitelist ${HOME}/.local/share/fonts
whitelist ${HOME}/.pangorc

# gtk
whitelist ${HOME}/.config/gtk-2.0
whitelist ${HOME}/.config/gtk-3.0
whitelist ${HOME}/.config/gtk-4.0
whitelist ${HOME}/.config/gtkrc
whitelist ${HOME}/.config/gtkrc-2.0
whitelist ${HOME}/.gnome2
whitelist ${HOME}/.gnome2-private
whitelist ${HOME}/.gtk-2.0
whitelist ${HOME}/.gtkrc
whitelist ${HOME}/.gtkrc-2.0
whitelist ${HOME}/.kde/share/config/gtkrc
whitelist ${HOME}/.kde/share/config/gtkrc-2.0
whitelist ${HOME}/.kde4/share/config/gtkrc
whitelist ${HOME}/.kde4/share/config/gtkrc-2.0
whitelist ${HOME}/.local/share/themes
whitelist ${HOME}/.themes

# qt/kde
whitelist ${HOME}/.cache/kioexec/krun
whitelist ${HOME}/.config/Kvantum
whitelist ${HOME}/.config/Trolltech.conf
whitelist ${HOME}/.config/QtProject.conf
whitelist ${HOME}/.config/kdeglobals
whitelist ${HOME}/.config/kio_httprc
whitelist ${HOME}/.config/kioslaverc
whitelist ${HOME}/.config/ksslcablacklist
whitelist ${HOME}/.config/qt5ct
whitelist ${HOME}/.config/qt6ct
whitelist ${HOME}/.config/qtcurve
whitelist ${HOME}/.kde/share/config/kdeglobals
whitelist ${HOME}/.kde/share/config/kio_httprc
whitelist ${HOME}/.kde/share/config/kioslaverc
whitelist ${HOME}/.kde/share/config/ksslcablacklist
whitelist ${HOME}/.kde/share/config/oxygenrc
whitelist ${HOME}/.kde/share/icons
whitelist ${HOME}/.kde4/share/config/kdeglobals
whitelist ${HOME}/.kde4/share/config/kio_httprc
whitelist ${HOME}/.kde4/share/config/kioslaverc
whitelist ${HOME}/.kde4/share/config/ksslcablacklist
whitelist ${HOME}/.kde4/share/config/oxygenrc
whitelist ${HOME}/.kde4/share/icons
whitelist ${HOME}/.local/share/qt5ct
whitelist ${HOME}/.local/share/qt6ct

# NixOS specific to resolve binary paths in
# user environment
whitelist ${HOME}/.nix-profile
#endregion: @bundler [/etc/firejail/whitelist-common.inc] END
#region: @bundler [/etc/firejail/whitelist-run-common.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

whitelist /run/NetworkManager/resolv.conf
whitelist /run/avahi-daemon/socket
whitelist /run/cups/cups.sock
whitelist /run/dbus/system_bus_socket
whitelist /run/media
whitelist /run/resolvconf/resolv.conf
whitelist /run/netconfig/resolv.conf	# openSUSE Leap
whitelist /run/shm
whitelist /run/systemd/journal/dev-log
whitelist /run/systemd/journal/socket
whitelist /run/systemd/resolve/resolv.conf
whitelist /run/systemd/resolve/stub-resolv.conf
whitelist /run/udev/data
whitelist /run/opengl-driver	# NixOS
#endregion: @bundler [/etc/firejail/whitelist-run-common.inc] END
#region: @bundler [/etc/firejail/whitelist-runuser-common.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

# common ${RUNUSER} (=/run/user/$UID) whitelist for all profiles

whitelist ${RUNUSER}/bus
whitelist ${RUNUSER}/dconf
whitelist ${RUNUSER}/gdm/Xauthority
whitelist ${RUNUSER}/ICEauthority
whitelist ${RUNUSER}/.mutter-Xwaylandauth.*
whitelist ${RUNUSER}/pulse/native
whitelist ${RUNUSER}/pipewire-?
whitelist ${RUNUSER}/wayland-?
whitelist ${RUNUSER}/xauth_*
whitelist ${RUNUSER}/[[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]]-[[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]]-[[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]]-[[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]]-[[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]][[:xdigit:]]
#endregion: @bundler [/etc/firejail/whitelist-runuser-common.inc] END
#region: @bundler [/etc/firejail/whitelist-usr-share-common.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

# common /usr/share whitelist for all profiles

whitelist /usr/share/alsa
whitelist /usr/share/applications
whitelist /usr/share/ca-certificates
whitelist /usr/share/crypto-policies
whitelist /usr/share/cursors
whitelist /usr/share/dconf
whitelist /usr/share/distro-info
whitelist /usr/share/drirc.d
whitelist /usr/share/egl
whitelist /usr/share/enchant
whitelist /usr/share/enchant-2
whitelist /usr/share/file
whitelist /usr/share/fontconfig
whitelist /usr/share/fonts
whitelist /usr/share/fonts-config
whitelist /usr/share/gir-1.0
whitelist /usr/share/gjs-1.0
whitelist /usr/share/glib-2.0
whitelist /usr/share/glvnd
whitelist /usr/share/gtk-2.0
whitelist /usr/share/gtk-3.0
whitelist /usr/share/gtk-engines
whitelist /usr/share/gtksourceview-3.0
whitelist /usr/share/gtksourceview-4
whitelist /usr/share/hunspell
whitelist /usr/share/hwdata
whitelist /usr/share/icons
whitelist /usr/share/icu
whitelist /usr/share/knotifications5
whitelist /usr/share/kservices5
whitelist /usr/share/Kvantum
whitelist /usr/share/kxmlgui5
whitelist /usr/share/libdrm
whitelist /usr/share/libthai
whitelist /usr/share/locale
whitelist /usr/share/mime
whitelist /usr/share/misc
whitelist /usr/share/Modules
whitelist /usr/share/myspell
whitelist /usr/share/p11-kit
whitelist /usr/share/perl
whitelist /usr/share/perl5
whitelist /usr/share/pipewire
whitelist /usr/share/pixmaps
whitelist /usr/share/pki
whitelist /usr/share/plasma
whitelist /usr/share/publicsuffix
whitelist /usr/share/qt
whitelist /usr/share/qt4
whitelist /usr/share/qt5
whitelist /usr/share/qt5ct
whitelist /usr/share/qt6
whitelist /usr/share/qt6ct
whitelist /usr/share/sounds
whitelist /usr/share/tcl8.6
whitelist /usr/share/tcltk
whitelist /usr/share/terminfo
whitelist /usr/share/texlive
whitelist /usr/share/texmf
whitelist /usr/share/themes
whitelist /usr/share/thumbnail.so
whitelist /usr/share/uim
whitelist /usr/share/vulkan
whitelist /usr/share/X11
whitelist /usr/share/xml
whitelist /usr/share/zenity
whitelist /usr/share/zoneinfo
#endregion: @bundler [/etc/firejail/whitelist-usr-share-common.inc] END
#region: @bundler [/etc/firejail/whitelist-var-common.inc] BEGIN
# This file is overwritten during software install.
# Persistent customizations should go in a .local file.

# common /var whitelist for all profiles

whitelist /var/lib/aspell
whitelist /var/lib/ca-certificates
whitelist /var/lib/dbus
whitelist /var/lib/menu-xdg
whitelist /var/lib/uim
whitelist /var/cache/fontconfig
whitelist /var/tmp
whitelist /var/run
whitelist /var/lock
#endregion: @bundler [/etc/firejail/whitelist-var-common.inc] END

# Add the next line to your chromium-common.local if your kernel allows unprivileged userns clone.
#include chromium-common-hardened.inc.profile

apparmor
caps.keep sys_admin,sys_chroot
netfilter
nodvd
nogroups
noinput
notv
?BROWSER_DISABLE_U2F: nou2f

disable-mnt
private-cache
?BROWSER_DISABLE_U2F: private-dev
#private-tmp - issues when using multiple browser sessions

blacklist ${PATH}/curl
blacklist ${PATH}/wget
blacklist ${PATH}/wget2

#dbus-user none - prevents access to passwords saved in GNOME Keyring and KWallet, also breaks Gnome connector.
dbus-system none

# The file dialog needs to work without d-bus.
?HAS_NODBUS: env NO_CHROME_KDE_FILE_DIALOG=1
#endregion: @bundler [/etc/firejail/chromium-common.profile] END
#endregion: @bundler [/etc/firejail/yandex-browser.profile] END
#endregion: @bundler [aides-yandex-browser-stable.profile] END
