include aides-yandex-music.local
include globals.local

noblacklist ${HOME}/.config/yandex-music
noblacklist ${HOME}/.config/yandex-music.conf

mkdir ${HOME}/.config/yandex-music
mkfile ${HOME}/.config/yandex-music.conf
whitelist ${HOME}/.config/yandex-music
whitelist ${HOME}/.config/yandex-music.conf

ignore dbus-user none
ignore dbus-system none

include electron-common.profile
