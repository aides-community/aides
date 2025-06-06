# Example of alr.sh
# Check l.aides.space/alr-sh for a documentation.
name=yandex-disk
version=0.1.6.1080
release=1
summary='Yandex.Disk for Linux client'
group='Other'
desc='Yandex.Disk for Linux client'
maintainer='Vladimir Vaskov <rirusha@altlinux.org'
architectures=('amd64')
homepage='http://disk.yandex.ru/'
license=('custom')

provides=()
conflicts=()

scripts=(
	['postinstall']='postinstall.sh'
)

_deb_package="yandex-disk_${version}_amd64.deb"

sources=(
	"https://repo.yandex.ru/yandex-disk/deb/pool/main/y/yandex-disk/$_deb_package?~name=$_deb_package"
)

checksums=(
	sha256:47ba503b4dfccecc824386d67d686abe4b5356b8b546e48fce8811b5fa88a718
)

build_deps=(
	tar
)

opt_deps=(
	'yandex-disk-indicator: Tray icon for Yandex.Disk'
)

deps=(

)

auto_req=1
auto_prov=1

package() {
	cd "$srcdir"
	ar x "$_deb_package"
	tar -xf data.tar.gz -C "$pkgdir"
	install-license "${pkgdir}/usr/share/doc/yandex-disk/copyright" ${name}/LICENSE
	install-systemd-user "${scriptdir}/yandex-disk.service" yandex-disk.service
	install -Dm 644 "${scriptdir}/README.md" -t "${pkgdir}/usr/share/doc/${name}/"
}

# files(): Lists all files to be included in the final package.
files() {
	echo ''
}
