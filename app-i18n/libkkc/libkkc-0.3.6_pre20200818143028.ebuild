# Copyright 2013-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"
PYTHON_COMPAT=(python3_{8,9})

inherit autotools python-any-r1 vala

if [[ "${PV}" == "9999" ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/ueno/libkkc"
elif [[ "${PV}" == *_pre* ]]; then
	LIBKKC_GIT_REVISION="e33e7fba10e8db0df2e70688cdc24c521354a97d"
fi

DESCRIPTION="Japanese Kana Kanji conversion input method library"
HOMEPAGE="https://github.com/ueno/libkkc"
if [[ "${PV}" == "9999" ]]; then
	SRC_URI=""
elif [[ "${PV}" == *_pre* ]]; then
	SRC_URI="https://github.com/ueno/${PN}/archive/${LIBKKC_GIT_REVISION}.tar.gz -> ${P}.tar.gz"
else
	SRC_URI="https://github.com/ueno/${PN}/releases/download/v${PV}/${P}.tar.gz"
fi

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls static-libs"

BDEPEND="$(python_gen_any_dep 'dev-libs/marisa[python,${PYTHON_USEDEP}]')
	$(vala_depend)
	dev-libs/gobject-introspection
	virtual/pkgconfig
	nls? ( sys-devel/gettext )"
DEPEND="dev-libs/glib:2
	dev-libs/json-glib
	dev-libs/libgee:0.8
	dev-libs/marisa
	nls? ( virtual/libintl )"
RDEPEND="${DEPEND}"

if [[ "${PV}" == *_pre* ]]; then
	S="${WORKDIR}/libkkc-${LIBKKC_GIT_REVISION}"
fi

python_check_deps() {
	has_version -b "dev-libs/marisa[python,${PYTHON_USEDEP}]"
}

src_prepare() {
	default
	eautoreconf
	vala_src_prepare
}

src_configure() {
	econf \
		$(use_enable nls) \
		$(use_enable static-libs static)
}

src_install() {
	default
	find "${D}" -name "*.la" -type f -delete || die

	insinto "/usr/share/libkkc/" || die
	doins -r "${S}/tests/data/models" || die
}
