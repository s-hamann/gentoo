# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
PYTHON_REQ_USE='threads(+)'

inherit meson-multilib python-single-r1

DESCRIPTION="A simple but extensible successor of LADSPA"
HOMEPAGE="https://lv2plug.in/"
SRC_URI="https://lv2plug.in/spec/${P}.tar.xz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ppc ppc64 ~riscv ~sparc x86"
IUSE="doc plugins test"
RESTRICT="!test? ( test )"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="
	plugins? ( virtual/pkgconfig )
	doc? (
		app-text/doxygen
		dev-python/rdflib
	)
	test? (
		dev-libs/sord[tools]
		dev-python/rdflib
	)
"
CDEPEND="
	${PYTHON_DEPS}
	plugins? (
		media-libs/libsamplerate
		media-libs/libsndfile
		x11-libs/gtk+:2[${MULTILIB_USEDEP}]
	)
"
DEPEND="
	${CDEPEND}
	doc? ( dev-python/markdown )
"
RDEPEND="
	${CDEPEND}
	$(python_gen_cond_dep '
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/pygments[${PYTHON_USEDEP}]
		dev-python/rdflib[${PYTHON_USEDEP}]
	')
"

PATCHES=(
	"${FILESDIR}/${PN}-1.18.6-add-missing-lv2.h.patch"
	"${FILESDIR}/${P}-tests-optional.patch"
)

src_prepare() {
	default

	# XXX: Drop this > 1.18.10, -Dstrict=false should prevent it now, bug #906047.
	sed -i -e "/codespell = /s:get_option('tests'):false:" test/meson.build || die

	# serdi >=0.32.0 doesn't pass, bug #930273.
	sed -i -e "/serdi = /s:find_program(.*):disabler():" test/meson.build || die

	# fix doc installation path
	sed -iE "s%lv2_docdir = .*%lv2_docdir = '${EPREFIX}/usr/share/doc/${PF}'%g" meson.build || die
}

multilib_src_configure() {
	local emesonargs=(
		-Dlv2dir="${EPREFIX}"/usr/$(get_libdir)/lv2
		-Dstrict=false
		$(meson_native_use_feature doc docs)
		$(meson_feature plugins)
		$(meson_feature test tests)
	)

	meson_src_configure
}

multilib_src_install_all() {
	local DOCS=( NEWS README.md )
	einstalldocs
}
