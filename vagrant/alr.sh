name=vagrant
version=2.4.6
release=1
summary="Build and distribute virtualized development environments"
group="Development/Tools"
desc="Vagrant is a tool for building and distributing virtualized development
environments."
maintainer="Maxim Slipenko <maks1ms@alt-gnome.ru>"
architectures=('amd64')
homepage="https://vagrantup.com"
license=('BUSL-1.1')

auto_req=1
auto_req_skiplist=(
	"/opt/vagrant/embedded/*"
)
auto_prov=1
auto_prov_skiplist=(
	"/opt/vagrant/embedded/*"
)

_deb_package="vagrant_${version}_amd64.deb"

sources=(
	"https://hashicorp-releases.yandexcloud.net/vagrant/${version}/vagrant_${version}-1_amd64.deb?~name=$_deb_package"
)

checksums=(
	sha256:e4e1ac602dbc5e958aa9b8c3f44e9a5cb01a98f88dcff7ded3785e7aabef5fc7
)

build_deps=(
	binutils
	tar
)

prepare() {
	cd "$srcdir"
	ar x "$_deb_package"
}

package() {
	tar -xf $srcdir/data.tar.gz -C "$pkgdir"
}

files() {
	printf '"%s" ' ./opt/**/*
	echo ./usr/bin/*
}
