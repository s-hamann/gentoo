# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

TEXLIVE_MODULE_CONTENTS="arphic arphic-ttf asymptote-by-example-zh-cn asymptote-faq-zh-cn asymptote-manual-zh-cn cns ctex ctex-faq fandol fduthesis hyphen-chinese impatient-cn install-latex-guide-zh-cn latex-notes-zh-cn lshort-chinese nanicolle njurepo pgfornament-han qyxf-book texlive-zh-cn texproposal xtuthesis upzhkinsoku xpinyin zhlineskip zhlipsum zhmetrics zhmetrics-uptex zhnumber zhspacing collection-langchinese
"
TEXLIVE_MODULE_DOC_CONTENTS="arphic.doc arphic-ttf.doc asymptote-by-example-zh-cn.doc asymptote-faq-zh-cn.doc asymptote-manual-zh-cn.doc cns.doc ctex.doc ctex-faq.doc fandol.doc fduthesis.doc impatient-cn.doc install-latex-guide-zh-cn.doc latex-notes-zh-cn.doc lshort-chinese.doc nanicolle.doc njurepo.doc pgfornament-han.doc qyxf-book.doc texlive-zh-cn.doc texproposal.doc xtuthesis.doc upzhkinsoku.doc xpinyin.doc zhlineskip.doc zhlipsum.doc zhmetrics.doc zhmetrics-uptex.doc zhnumber.doc zhspacing.doc "
TEXLIVE_MODULE_SRC_CONTENTS="ctex.source fduthesis.source njurepo.source xpinyin.source zhlipsum.source zhmetrics.source zhnumber.source "
inherit  texlive-module
DESCRIPTION="TeXLive Chinese"

LICENSE=" FDL-1.1 GPL-1 GPL-2 LGPL-2 LPPL-1.3 LPPL-1.3c MIT public-domain TeX TeX-other-free "
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 ~hppa ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris"
IUSE=""
DEPEND=">=dev-texlive/texlive-langcjk-2021"

RDEPEND="${DEPEND} "
# Avoids collision with app-text/ttf2pk2
src_prepare() {
	default
	local i=texmf-dist/source/fonts/zhmetrics/ttfonts.map
	[[ -f ${i} ]] && rm -f "${i}"
}
