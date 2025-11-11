# This is necessary to insert screenshots
noblacklist ${PICTURES}
whitelist ${PICTURES}

# https://altlinux.space/aides-pkgs/yandex-browser-stable/issues/19
noblacklist ${DESKTOP}
whitelist ${DESKTOP}

# For PWA
ignore read-only ${HOME}/.local/share/applications
read-write ${HOME}/.local/share/applications

# Fix for url
env XDG_CURRENT_DESKTOP=
env DE=flatpak

include yandex-browser.profile