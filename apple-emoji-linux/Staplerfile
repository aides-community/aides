# Example of alr.sh
# Check l.aides.space/alr-sh for a documentation.
name=apple-emoji-linux
version=18.4 # upstream version
release=1
summary="Apple Color Emoji is a color typeface used by iOS and macOS to display emoji"
group="Other" # See /usr/lib/rpm/GROUPS for valid values
desc="Apple Color Emoji is a color typeface used by iOS and macOS to display emoji"
maintainer="Anton Palgunov <toxblh@gmail.com>"
# Array of Go arches (go tool dist list | cut -d/ -f2 | sort | uniq) or "all"
architectures=("all")
homepage="https://github.com/samuelngs/apple-emoji-linux"
license=("custom")

provides=(emoji-font)
conflicts=()

sources=(
    "$homepage/releases/download/v$version/AppleColorEmoji.ttf"
)

checksums=(
    sha256:a4fd077bd11437b4940d8cf08f4084e1edfd4ae359f92573ec576652f885eabd
)

# Automatically generate runtime dependencies and provided symbols
auto_req=1
auto_prov=1

package() {
    install -Dm644 "$srcdir/AppleColorEmoji.ttf" "$pkgdir/usr/share/fonts/ttf/apple-color-emoji/AppleColorEmoji.ttf"
    install -Dm644 -t "$pkgdir/usr/share/fontconfig/conf.avail" "$scriptdir/75-apple-color-emoji.conf"
    install -d "$pkgdir/etc/fonts/conf.d"
    ln -s "/usr/share/fontconfig/conf.avail/75-apple-color-emoji.conf" "$pkgdir/etc/fonts/conf.d/"
}