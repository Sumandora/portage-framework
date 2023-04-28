EAPI=8

inherit git-r3

MY_PN=MCFM
MY_P=${MY_PN}-${PV}

EGIT_REPO_URI="https://github.com/Sumandora/FrameworkCSGO.git"
EGIT_BRANCH="master"

DESCRIPTION="Cheating software for the steam game Counter Strike: Global Offensive"
HOMEPAGE="https://github.com/Sumandora/FrameworkCSGO.git"

LICENSE="GPL-3+"
SLOT="0"

KEYWORDS="~amd64"

DEPEND="
	sys-devel/gdb
"
RDEPEND="${DEPEND}"
BDEPEND="
	sys-devel/gcc
	dev-util/cmake
	media-libs/libsdl2
	media-libs/mesa
	dev-util/patchelf
	sys-devel/binutils
"

src_compile() {
	# Force to GCC because Clang doesn't work and nothing else is supported
	export CC=gcc
	export CXX=g++
	export AR="gcc-ar"
	export NM="gcc-nm"
	export RANLIB="gcc-ranlib"

	# Remove additional flags as they are likely to break the cheat
	export CFLAGS=""
	export CXXFLAGS=""
	export LDFLAGS=""

	./Build.sh
}

src_install() {
	dolib.so Build/libFrameworkCSGO.so
}

pkg_postinst() {
	einfo "Compiled the cheat and saved it to your libraries"
	einfo "Injection can be done using any ordinary dlopen injector"
	einfo "GDB can be used to call dlopen in the csgo application"
	einfo "The shared object had its soname patched to be"
	einfo "libMangoHud.so, you might want to rename it"
}
