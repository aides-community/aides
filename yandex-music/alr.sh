name=yandex-music
version=5.54.0
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
	sha256:35017023949c2aa74fd2ed44f34ff93c5b240e4cdbfa26e8b51d6e7cc4e2bf13
)

# Dependencies needs for build
# If you use auto_req=1 you must
# list runtime dependencies here
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

# Runtime dependencies
deps=()

auto_req=1
auto_prov=1

package() {
	mv "$srcdir/usr" "$pkgdir/usr"
}

files() {
	printf '"%s" ' ./usr/**/*
}
