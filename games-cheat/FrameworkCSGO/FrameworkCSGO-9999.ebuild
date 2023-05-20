EAPI=8

inherit git-r3 savedconfig

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
	dev-util/cmake
	media-libs/libsdl2
	virtual/opengl
	sys-devel/binutils
	sys-apps/sed
"

src_prepare() {
	default

	restore_config ProjectName
}

src_compile() {
	default

	./Build.sh
}

src_install() {
	default

	save_config ProjectName

	sed -i "s/\$(cat ProjectName)/$(cat ProjectName)/g" Load.sh
	sed -i '/cp Build\/\$lib_name/d' Load.sh

	newbin Load.sh FrameworkCSGO
	dolib.so Build/lib$(cat ProjectName).so
}

pkg_postinst() {
	elog "Compiled the cheat and saved it to your libraries"
	elog "Injection is done by executing FrameworkCSGO"
}
