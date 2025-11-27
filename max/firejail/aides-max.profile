mkdir ${HOME}/.config/MAX
whitelist ${HOME}/.config/MAX
whitelist ${DOCUMENTS}
whitelist ${DOWNLOADS}

# fix system tray: https://github.com/netblue30/firejail/issues/1137#issuecomment-669496384
ignore private-tmp
mkdir /tmp/MAX-tmp
whitelist /tmp/MAX-tmp
env TMPDIR=/tmp/MAX-tmp
env TMP=/tmp/MAX-tmp

ignore dbus-user none
dbus-user filter
dbus-user.talk org.freedesktop.Notifications
dbus-user.talk org.freedesktop.portal.Desktop
# system tray
dbus-user.talk org.kde.StatusNotifierWatcher

# Fix url open
env XDG_CURRENT_DESKTOP=
env DE=flatpak

# for firejail <= 0.9.74
include electron.profile
# for firejail >= 0.9.74
# include electron-common.profile