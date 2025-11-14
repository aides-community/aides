noblacklist ${HOME}/.config/YandexMusic
mkdir ${HOME}/.config/YandexMusic
whitelist ${HOME}/.config/YandexMusic

# https://github.com/netblue30/firejail/issues/1137#issuecomment-669496384
ignore private-tmp
mkdir /tmp/yandex-music-tmp
whitelist /tmp/yandex-music-tmp
env TMPDIR=/tmp/yandex-music-tmp
env TMP=/tmp/yandex-music-tmp

ignore dbus-user none

dbus-user filter
dbus-user.own org.mpris.MediaPlayer2.chromium.*
dbus-user.talk org.freedesktop.Notifications
dbus-user.talk org.freedesktop.portal.Desktop
dbus-user.talk org.kde.StatusNotifierWatcher

# for firejail <= 0.9.74
include electron.profile
# for firejail >= 0.9.74
# include electron-common.profile
