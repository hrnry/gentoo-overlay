# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson multilib

DESCRIPTION="MVTools is a set of filters for motion estimation and compensation."
HOMEPAGE="https://github.com/dubhater/vapoursynth-mvtools"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/dubhater/${PN}.git"
else
	SRC_URI="https://github.com/dubhater/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
fi

KEYWORDS="~amd64 ~x86"
SLOT="0"

LICENSE="GPL-2"
IUSE="lto"

RDEPEND+="
	media-libs/vapoursynth
	sci-libs/fftw:3.0
"
DEPEND="${RDEPEND}"

src_configure() {
	local emesonargs=(
		--libdir="/usr/$(get_libdir)/vapoursynth/"
		-Db_lto=$(usex lto true false)
	)
	meson_src_configure
}
