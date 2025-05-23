# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop toolchain-funcs

MY_PN="7kaa"
MY_PV="$(ver_rs 3- '')"
MY_P="${MY_PN}-${MY_PV}"

DESCRIPTION="Seven Kingdoms: Ancient Adversaries"
HOMEPAGE="https://7kfans.com/"
SRC_URI="https://downloads.sourceforge.net/skfans/${MY_P}.tar.gz
	https://dev.gentoo.org/~pinkbyte/distfiles/${MY_PN}.png"

S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 ~arm64 ppc64 x86"

DEPEND="net-libs/enet:1.3=
	media-libs/libsdl2[X,video]
	media-libs/openal
	net-misc/curl"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${MY_P}.tar.gz
}

src_compile() {
	emake AR="$(tc-getAR)"
}

src_install() {
	default

	doicon "${DISTDIR}/${MY_PN}.png"
	make_desktop_entry "${MY_PN}" "Seven Kingdoms: Ancient Adversaries" "${MY_PN}" "Game;StrategyGame"
}
