# Copyright 2021-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Library for testing Python applications in Kerberos 5 environments"
HOMEPAGE="
	https://github.com/pythongssapi/k5test/
	https://pypi.org/project/k5test/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc x86"
