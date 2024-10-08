# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit toolchain-funcs

DESCRIPTION="A compact getty program for virtual consoles only"
HOMEPAGE="https://sourceforge.net/projects/mingetty"
SRC_URI="https://downloads.sourceforge.net/${PN}/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~mips ppc ppc64 ~s390 sparc x86"
IUSE="unicode"

PATCHES=(
	"${FILESDIR}/${PN}-1.08-check_chroot_chdir_nice.patch"
)

src_prepare() {
	use unicode && eapply "${FILESDIR}"/${PN}-1.08-utf8.patch
	default
}

src_compile() {
	emake CFLAGS="${CFLAGS} -Wall -W -pipe -D_GNU_SOURCE" CC="$(tc-getCC)"
}

src_install() {
	dodir /sbin /usr/share/man/man8
	emake DESTDIR="${D}" install
}
