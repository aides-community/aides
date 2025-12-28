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
include whitelist-1793-workaround.inc
#endregion

# For PWA
ignore read-only ${HOME}/.local/share/applications
read-write ${HOME}/.local/share/applications

# Fix for url
env XDG_CURRENT_DESKTOP=
env DE=flatpak

include yandex-browser.profile