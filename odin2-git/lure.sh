name='odin2-git'
version='2.4.1'
release='0'
desc='Odin 2 free VST3, CLAP, AU and LV2 synthesizer plugin'
homepage='https://thewavewarden.com/pages/odin-2'
maintainer='Nil Geisweiller <ngeiswei@gmail.com>'
architectures=('amd64')
license=('GPL-3.0-or-later')
provides=('odin2')
conflicts=('odin2')

build_deps=('cmake' 'gcc' 'g++' 'libx11-dev' 'libwebkit2gtk-4.0-dev' 'mesa-common-dev' 'libasound2-dev' 'libcurl4-gnutls-dev' 'libcurl4-gnutls-dev')

sources=("git+https://github.com/TheWaveWarden/odin2.git")
checksums=('SKIP')

version() {
	cd "${srcdir}/emacs"
	git-version
}

prepare() {
	cd "${srcdir}/odin2"
	git submodule update --init --recursive
	cmake -B build -D CMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
}

build() {
	cd "${srcdir}/odin2"
	cmake --build build --config Release
}

package() {
	cd "${srcdir}/odin2"
	make install
}
