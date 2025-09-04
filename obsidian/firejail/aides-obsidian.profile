noblacklist ${DOCUMENTS}
noblacklist ${HOME}/.config/obsidian

mkdir ${HOME}/.config/obsidian
whitelist ${DOCUMENTS}
whitelist ${HOME}/.config/obsidian

ipc-namespace
nonewprivs
noroot
protocol unix,inet,inet6
# net none # networking is needed to download/update plugins

ignore dbus-user none

private-bin basename,bash,cat,cut,electron,electron[0-9],electron[0-9][0-9],gawk,grep,obsidian,realpath,tr

# Redirect
include electron.profile
