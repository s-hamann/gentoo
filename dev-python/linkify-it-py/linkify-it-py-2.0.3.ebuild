# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3_11 python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Links recognition library with full unicode support"
HOMEPAGE="
	https://github.com/tsutsu3/linkify-it-py/
	https://pypi.org/project/linkify-it-py/
"
# no tests in sdist, as of 2.0.1
SRC_URI="
	https://github.com/tsutsu3/linkify-it-py/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86"

RDEPEND="
	dev-python/uc-micro-py[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
