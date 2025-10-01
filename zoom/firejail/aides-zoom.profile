# Fix url open
ignore dbus-user none
dbus-user filter
dbus-user.talk org.freedesktop.Notifications
dbus-user.talk org.freedesktop.portal.Desktop

env XDG_CURRENT_DESKTOP=
env DE=flatpak

include zoom.profile