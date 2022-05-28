# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson optfeature

DESCRIPTION="Greybird Desktop Suite"
HOMEPAGE="https://github.com/shimmerproject/Greybird"
SRC_URI="https://github.com/shimmerproject/${PN^}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-SA-3.0"
SLOT="0"
KEYWORDS="amd64 ~arm64 ~ppc ~ppc64 x86"

# Theme files, no test case available.
RESTRICT="test"

RDEPEND="x11-libs/gtk+:3
	x11-themes/gtk-engines-murrine"
DEPEND="${RDEPEND}
	dev-lang/sassc
	dev-libs/glib:2
	x11-libs/gdk-pixbuf:2
	gnome-base/librsvg:2"

S="${WORKDIR}/${P^}"

# WARNING on (snip)gtk-3.0/_common.scss:
# Compound selectors may no longer be extended.
# Consider `@extend (snip)` instead.
# See http://bit.ly/ExtendCompound for details.
#
#   @extend %button_basic:drop(active)    --> @extend %button_basic, :drop(active);
#   @extend *:link:selected               --> @extend *, :link, :selected
#   @extend %button.flat.suggested-action --> @extend %button, .flat, .suggested-action
#
# --> Icons are outlined and resized when unfocused
src_prepare() {
	default
#	sed -i -e 's/@extend \([^:.]\+\)\([:.][^;]\+;\)/@extend \1, \2/' -e 's/, \([:.][^:.]\+\)\([:.][^;]\+\)/, \1, \2/' {light,dark}/gtk-3.0/_common.scss
}

pkg_postinst() {
	optfeature "matching icon theme" x11-themes/elementary-xfce-icon-theme
	optfeature "matching cursor theme" x11-themes/vanilla-dmz-xcursors
}
