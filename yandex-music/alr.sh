name=yandex-music
version=5.56.0
release=1
summary="Linux client for Yandex Music"
group="Sound"
desc="Native YandexMusic client for Linux. 
Built using repacking of Windows client (Electron app)."
maintainer="Maxim Slipenko <maks1ms@alt-gnome.ru>"
architectures=("amd64")
homepage="https://github.com/cucumber-sp/yandex-music-linux"
license=("custom")

provides=()
conflicts=()

sources=(
	"https://github.com/cucumber-sp/yandex-music-linux/releases/download/v${version}/yandex-music_${version}_x64.tar.gz"
)

checksums=(
	sha256:fbe21d11f8279fc92e4a6061f6215a576a4012eede90cc70154991a4c578ea31
)

build_deps=(
	libXrandr
	libXext
	libX11
	libdbus
	libnss
	libat-spi2-core
	libXdamage
	at-spi2-atk
	libatk
	libgbm
	libxkbcommon
	libcups
	libpango
	libnspr
	libXfixes
	libgio
	libxcb
	libXcomposite
	libalsa
	libcairo
	libgtk+3
)

deps=(
	firejail
)

auto_req=1
auto_prov=1

firejailed=1
firejail_profiles=(
	['default']='firejail.profile'
)

package() {
	mv "$srcdir/usr" "$pkgdir/usr"
}

files() {
	echo ./usr/share/applications/$name.desktop
	echo ./usr/share/icons/hicolor/**/apps/$name.png
	echo ./usr/share/pixmaps/$name.png
	echo ./usr/share/licenses/$name/*
	echo ./usr/lib/$name
	echo ./usr/lib/$name/**/*
	echo ./usr/bin/$name
}
