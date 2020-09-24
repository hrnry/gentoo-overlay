# Copyright 2013-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

inherit cmake-utils

DESCRIPTION="fcitx-kkc is an input method engine for Fcitx, which uses libkkc as its backend"
HOMEPAGE="https://github.com/fcitx/fcitx-kkc"
LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-i18n/fcitx
	app-i18n/fcitx-qt5
	app-i18n/libkkc
	app-i18n/skk-jisyo"
RDEPEND="${DEPEND}"

SRC_URI="https://github.com/fcitx/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

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
