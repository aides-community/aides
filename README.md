# Aides

> _The package repository you've been missing_

An unofficial proprietary repository for ALT (powered by [ALR](https://gitea.plemya-x.ru/Plemya-x/ALR)).

> [!WARNING]
>
> **Attention!** This community project has not been verified, is not affiliated with, and is not supported by LLC "Basalt SPO" and the ALT Linux Team community.

## How to use?

1. Install ALR:

> Do not forget about root: use commands via `sudo` or as the root user (`su -`)

```shell
apt-repo add 386131
apt-get update
apt-get install alr
```

2. Add the Aides repository:

```shell
alr repo add aides https://altlinux.space/aides-community/aides.git
```

Alternatively, edit the config at `/etc/alr/alr.toml`:

```toml
rootCmd = 'sudo'
useRootCmd = true
pagerStyle = 'native'
ignorePkgUpdates = []
autoPull = true
logLevel = ''

[[repo]]
name = 'aides'
url = 'https://altlinux.space/aides-community/aides'
ref = ''
```
