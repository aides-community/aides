include max.local

include globals.local

# Fix url open
env XDG_CURRENT_DESKTOP=
env DE=flatpak

include allow-bin-sh.inc

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-programs.inc
include disable-shell.inc
include disable-xdg.inc

mkdir ${HOME}/.cache/MAX
mkdir ${HOME}/.config/MAX
whitelist ${HOME}/.cache/MAX
whitelist ${HOME}/.config/MAX
whitelist /usr/share/max

include whitelist-common.inc
include whitelist-run-common.inc
include whitelist-usr-share-common.inc
include whitelist-var-common.inc

apparmor
caps.drop all
ipc-namespace
netfilter
#no3d
nodvd
#nogroups
noinput
nonewprivs
noroot
notv
#nou2f
#novideo
protocol unix,inet,inet6,netlink
seccomp
seccomp.block-secondary

disable-mnt
private-bin max,bash,sh,xdg-open,grep,gdbus
private-cache
private-dev
#private-etc @tls-ca,@x11,os-release
#private-tmp

dbus-user filter
dbus-user.talk org.freedesktop.Notifications
dbus-user.talk org.freedesktop.portal.Desktop
# system tray
dbus-user.talk org.kde.StatusNotifierWatcher
dbus-user.talk org.a11y.Bus
dbus-user.talk org.freedesktop.secrets

dbus-system none

restrict-namespaces