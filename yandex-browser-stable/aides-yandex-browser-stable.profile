#region: for better user experience (https://t.me/aides_space/1272)
whitelist   ${HOME}
noblacklist ${DOCUMENTS}
whitelist   ${DOCUMENTS}
noblacklist ${MUSIC}
whitelist   ${MUSIC}
noblacklist ${VIDEOS}
whitelist   ${VIDEOS}
# This is necessary to insert screenshots
noblacklist ${PICTURES}
whitelist ${PICTURES}
# https://altlinux.space/aides-pkgs/yandex-browser-stable/issues/19
noblacklist ${DESKTOP}
whitelist ${DESKTOP}
#already whitelisted in yandex-browser.profile
#noblacklist ${DOWNLOADS}
#whitelist ${DOWNLOADS}
# FJOPT-OPTION-BEGIN
# 
# ID: restrict-home-access
# NAME-EN: Restrict access to home directory
# NAME-RU: Ограничить доступ к домашнему каталогу
# DESC-EN: Blocks file selection and uploads from home directory for maximum isolation
# DESC-RU: Блокирует выбор и загрузку файлов из домашней директории для максимальной изоляции
# BODY:
#nowhitelist ${HOME}
#blacklist ${DOCUMENTS}
#blacklist ${MUSIC}
#blacklist ${VIDEOS}
# FJOPT-OPTION-END
#endregion

#region: partitial fix for https://altlinux.space/aides-pkgs/yandex-browser-stable/issues/23
whitelist /usr/share/doc
#endregion

#region: fix for https://altlinux.space/aides-pkgs/yandex-browser-stable/issues/24
ignore read-only ${HOME}/.config/mimeapps.list
noblacklist ${HOME}/.config/mimeapps.list

noblacklist ${HOME}/.config/yandex-browser
noblacklist ${HOME}/.config/yandex-browser-beta
include whitelist-1793-workaround.inc
#endregion

# For PWA
ignore read-only ${HOME}/.local/share/applications
read-write ${HOME}/.local/share/applications

# Fix for url
env XDG_CURRENT_DESKTOP=
env DE=flatpak

include yandex-browser.profile