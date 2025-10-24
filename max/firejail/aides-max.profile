mkdir ${HOME}/.config/MAX
whitelist ${HOME}/.config/MAX
whitelist ${DOCUMENTS}
whitelist ${DOWNLOADS}

ignore dbus-user none
dbus-user filter
dbus-user.talk org.freedesktop.Notifications
dbus-user.talk org.freedesktop.portal.Desktop

# Fix url open
env XDG_CURRENT_DESKTOP=
env DE=flatpak

# for firejail <= 0.9.74
include electron.profile
# for firejail >= 0.9.74
# include electron-common.profile