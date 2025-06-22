_alr_update_preset=snap

_snap_name=singularityapp
_snap_channel=stable
_snap_url=https://api.snapcraft.io/api/v1/snaps/download/MGxJGb96XBV8UshTS2iqLOI4ylXW8xwY_119.snap

name=singularityapp
version=11.0.0
release=1
summary="Most powerful chaos management planner"
group="Office"
desc="Free your head for inspiration and fresh ideas. 
SingularityApp takes over your routine"
maintainer="Maxim Slipenko <maks1ms@alt-gnome.ru>"
architectures=("amd64")
homepage="https://singularity-app.ru"
license=("custom")

provides=()
conflicts=()

sources=(
	$_snap_url
)

checksums=(
	sha256:30e2f3f21da09fd573b1828d9abe2be7f711f8bfff7ec7184bbb62fa41d36c19
)

build_deps=(
	squashfs-tools
	at-spi2-atk
	libXcomposite
	libXdamage
	libXext
	libXfixes
	libXrandr
	libalsa
	libat-spi2-core
	libatk
	libcairo
	libcups
	libdbus
	libdbusmenu
	libdbusmenu-gtk3
	libdrm
	libgbm
	libgdk-pixbuf
	libgio
	libgtk+3
	libnspr
	libnss
	libpango
	libsqlite3
	libsystemd
	libxkbcommon
)

auto_req=1
auto_req_skiplist=(
	"/opt/singularityapp/usr/lib/x86_64-linux-gnu/libappindicator3.so.1.0.0"
)

prepare() {
	unsquashfs "${srcdir}/"*.snap
}

package() {
	mkdir -p "${pkgdir}/usr/share/pixmaps/"
	mkdir -p "${pkgdir}/usr/share/applications/"
	mkdir -p "${pkgdir}/opt/${name}"
	mkdir -p "${pkgdir}/usr/bin/"

	install ${srcdir}/squashfs-root/meta/gui/icon.png "${pkgdir}/usr/share/pixmaps/$name.png"
	install ${srcdir}/squashfs-root/meta/gui/*.desktop "${pkgdir}/usr/share/applications/$name.desktop"

	mv "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${name}"

	subst "s|^Icon=.*|Icon=$name|" "${pkgdir}/usr/share/applications/$name.desktop"
	subst "s|^Comment=$|Comment=$description|" "${pkgdir}/usr/share/applications/$name.desktop"

	install -m755 "${scriptdir}/singularityapp.sh" "${pkgdir}/usr/bin/singularityapp"
}

files() {
	printf '"%s" ' ./opt/**/*
	echo ./usr/bin/$name
	echo ./usr/share/pixmaps/$name.png
	echo ./usr/share/applications/$name.desktop
}
