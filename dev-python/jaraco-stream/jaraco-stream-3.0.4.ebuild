# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=${PN/-/.}
PYTHON_COMPAT=( pypy3_11 python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Routines for handling streaming data"
HOMEPAGE="
	https://github.com/jaraco/jaraco.stream/
	https://pypi.org/project/jaraco.stream/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm64 ~riscv x86"

RDEPEND="
	dev-python/more-itertools[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-scm-1.15.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
