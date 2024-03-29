# Copyright 1999-2022 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby26 ruby27 ruby30"

inherit ruby-fakegem

DESCRIPTION="All about Japanese battle heroine \"Pretty Cure (Precure)\"  http://sue445.hatenablog.com/entry/2013/12/16/000011"
HOMEPAGE="https://github.com/sue445/rubicure"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RUBY_FAKEGEM_EXTRAINSTALL="config"

ruby_add_rdepend "
	>=dev-ruby/activesupport-5.0.0
	>=dev-ruby/hashie-2.0.5
	>=dev-ruby/sengiri_yaml-1.0.0"
