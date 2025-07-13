name=vk-messenger
version=6.0.52
release=1
summary="VK Messenger"
group="Networking/Instant messaging"
maintainer="Maxim Slipenko <maks1ms@alt-gnome.ru>"
architectures=("amd64")
homepage="https://vk.me/app"
license=("custom")

provides=()
conflicts=()

_source_url=https://upload.object2.vk-apps.com/vk-me-desktop-dev-5837a06d-5f28-484a-ac22-045903cb1b1a/latest/vk-messenger.rpm
_source_checksum=sha256:c0317881acfe58b9ffc32acb7ffc78675facad22e0f4bbc26ac3d4357c60e4fa
_source_etag=f44b0baf0b9f5c4df066b9471970faed
_source_last_modified='Wed, 19 Feb 2025 09:01:54 GMT'

sources=($_source_url)
checksums=($_source_checksum)

build_deps=(
	"libXrandr.so.2()(64bit)"
	"libXext.so.6()(64bit)"
	"libX11.so.6()(64bit)"
	"libdbus-1.so.3()(64bit)"
	"libsmime3.so()(64bit)"
	"libatspi.so.0()(64bit)"
	"libXdamage.so.1()(64bit)"
	"libatk-bridge-2.0.so.0()(64bit)"
	"libnssutil3.so()(64bit)"
	"libdrm.so.2()(64bit)"
	"libatk-1.0.so.0()(64bit)"
	"libgbm.so.1()(64bit)"
	"libxkbcommon.so.0()(64bit)"
	"libcups.so.2()(64bit)"
	"libnss3.so()(64bit)"
	"libpango-1.0.so.0()(64bit)"
	"libnspr4.so()(64bit)"
	"libXfixes.so.3()(64bit)"
	"libgio-2.0.so.0()(64bit)"
	"libxcb.so.1()(64bit)"
	"libXcomposite.so.1()(64bit)"
	"libasound.so.2()(64bit)"
	"libcairo.so.2()(64bit)"
	"libgtk-3.so.0()(64bit)"
)

deps=()

auto_req=1
auto_prov=1

package() {
	cd $pkgdir
	rpm2cpio $srcdir/vk-messenger.rpm | cpio -idmv
}

files() {
	files-find \
		"/opt/${name}/**/*" \
		"/usr/bin/${name}" \
		"/usr/share/applications/${name}.desktop" \
		"/usr/share/icons/hicolor/*/apps/${name}.png"
}
