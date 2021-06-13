# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7,8,9} )
PYTHON_REQ_USE="threads(+)"

inherit autotools python-single-r1

DESCRIPTION="A video processing framework with simplicity in mind"
HOMEPAGE="http://www.vapoursynth.com/"
# http://vapoursynth.com/doc/installation.html#linux-and-os-x-compilation-instructions

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/${PN}/${PN}.git"
else
	inherit vcs-snapshot
	SRC_URI="https://github.com/${PN}/${PN}/archive/R${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
fi

KEYWORDS="~amd64"
SLOT="0"

LICENSE="LGPL-2.1"
IUSE=""

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND+="${PYTHON_DEPS}"
DEPEND="${RDEPEND}
	>=dev-python/cython-0.28
	virtual/pkgconfig
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
