# Example of alr.sh
# Check l.aides.space/alr-sh for a documentation.
name=jetbrains-toolbox
version=1.0.0 # upstream version
release=1
summary="Short oneline summary of $name"
group="Other" # See /usr/lib/rpm/GROUPS for valid values
desc="Long
multiline
description"
maintainer="Firstname Lastname <email@domain.com>"
# Array of Go arches (go tool dist list | cut -d/ -f2 | sort | uniq) or "all"
architectures=("amd64")
homepage="https://example.com"
license=("custom")

provides=()
conflicts=()

sources=(
#    "https://example.com/releases/${name}-${version}.tar.gz"
)

checksums=(
#    "SKIP" # Or replace with actual checksums e.g. sha256:xxx
)

# Dependencies needs for build
# If you use auto_req=1 you must 
# list runtime dependencies here
build_deps=(

)

# Runtime dependencies
deps=(

)

# Automatically generate runtime dependencies and provided symbols
auto_req=1
auto_prov=1

# prepare(): Unpacks and prepares the sources
prepare() {
    # echo "Preparing sources..."
}

# build(): Compiles or builds the software from source.
# Since Aides is for proprietary software, it looks superfluous.
# build() {
# 
# }

# package(): Installs the built files into the package directory (pkgdir).
package() {
    # mkdir -p "pkgdir/opt/name"
    # mv "srcdir/content/"* "pkgdir/opt/name"
}

# files(): Lists all files to be included in the final package.
files() {
    # printf '"%s" ' ./opt/**/*
}