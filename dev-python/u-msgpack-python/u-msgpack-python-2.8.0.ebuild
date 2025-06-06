# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{11..14} pypy3_11 )

inherit distutils-r1 pypi

DESCRIPTION="A portable, lightweight MessagePack serializer and deserializer"
HOMEPAGE="
	https://github.com/vsergeev/u-msgpack-python/
	https://pypi.org/project/u-msgpack-python/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux"

distutils_enable_tests pytest
