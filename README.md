# Aides

> *The package repository you've been missing*

Unofficial proprietary repository for ALT (ALR powered).

> [!WARNING]
> **Attention! This community project has not been verified, is not affiliated with, and is not supported by Basealt LLC and the ALT Linux Team.**

## How to use?

1. Install ALR

```shell
apt-repo add 386131
apt-get install alr
```

2. Add Aides repository

```shell
alr repo add aides https://altlinux.space/aides-community/aides.git
```

Or change config (`/etc/alr/alr.toml`) to:

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