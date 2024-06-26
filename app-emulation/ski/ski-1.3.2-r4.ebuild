# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="ia64 instruction set simulator"
HOMEPAGE="http://ski.sourceforge.net/"
SRC_URI="https://downloads.sourceforge.net/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug motif"

RDEPEND="dev-libs/libltdl:0=
	sys-libs/ncurses:0=
	virtual/libelf
	debug? ( sys-libs/binutils-libs:0= )
	motif? ( x11-libs/motif:0= )"
DEPEND="${RDEPEND}
	app-alternatives/yacc
	app-alternatives/lex
	dev-util/gperf"

# games-sports/ski and app-emulation/ski both install 'ski' binary, bug #653110
RDEPEND="${RDEPEND} !!games-sports/ski"

PATCHES=(
	"${FILESDIR}"/${P}-syscall-linux-includes.patch
	"${FILESDIR}"/${P}-remove-hayes.patch
	"${FILESDIR}"/${P}-no-local-ltdl.patch
	"${FILESDIR}"/${P}-AC_C_BIGENDIAN.patch
	"${FILESDIR}"/${P}-configure-withval.patch
	"${FILESDIR}"/${P}-binutils.patch
	"${FILESDIR}"/${P}-uselib.patch #592226
	"${FILESDIR}"/${P}-ncurses-config.patch
	"${FILESDIR}"/${P}-prototypes.patch
	"${FILESDIR}"/${P}-glibc-2.28.patch
	"${FILESDIR}"/${P}-gcc-10.patch #707144
	"${FILESDIR}"/${P}-lex-deps.patch #744676
)

src_prepare() {
	default

	if has_version ">=sys-libs/binutils-libs-2.34"; then
		eapply "${FILESDIR}"/${PN}-1.3.2-binutils-2.34.patch
	fi

	rm -rf libltdl src/ltdl.[ch] macros/ltdl.m4

	AT_M4DIR="macros" eautoreconf
}

src_configure() {
	econf \
		--without-included-ltdl \
		--without-gtk \
		$(use_with motif x11) \
		$(use_with debug bfd)
}
