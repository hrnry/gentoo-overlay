EAPI=5
USE_RUBY="ruby22 ruby23"

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
	>=dev-ruby/sengiri_yaml-0.0.2
	ruby_targets_ruby22? ( dev-ruby/backport_dig )"

all_ruby_prepare() {
	epatch "${FILESDIR}/1.0.6-parfait.patch"
}
