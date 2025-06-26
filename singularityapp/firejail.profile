include aides-singularityapp.local
include globals.local

noblacklist ${HOME}/.config/SingularityApp
mkdir ${HOME}/.config/SingularityApp
whitelist ${HOME}/.config/SingularityApp

noblacklist ${DOCUMENTS}
noblacklist ${DOWNLOADS}

include disable-common.inc
include disable-devel.inc
include disable-exec.inc
include disable-interpreters.inc
include disable-programs.inc
include disable-xdg.inc

whitelist ${DOCUMENTS}
whitelist ${DOWNLOADS}

caps.drop all
netfilter
nodvd
nogroups
noinput
nonewprivs
noroot
nosound
notv
nou2f
novideo
protocol unix,inet,inet6
seccomp

restrict-namespaces
