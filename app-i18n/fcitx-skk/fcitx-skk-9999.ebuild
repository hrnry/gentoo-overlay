# Copyright 2013-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake-utils

if [[ "${PV}" =~ (^|\.)9999$ ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/fcitx/fcitx-skk.git"
fi

DESCRIPTION="fcitx-skk is an input method engine for Fcitx, which uses libskk as its backend"
HOMEPAGE="https://github.com/fcitx/fcitx-skk"
LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""


DEPEND=">=app-i18n/fcitx-4.2.8:4[X]
	app-i18n/fcitx-qt5
	app-i18n/libskk
	app-i18n/skk-jisyo"
RDEPEND="${DEPEND}"


src_prepare() {
	cmake-utils_src_prepare
}

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}

#pkg_postinst() {}
#pkg_postrm() {}
