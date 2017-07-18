EAPI=5
USE_RUBY="ruby20 ruby21 ruby22"

inherit ruby-fakegem

DESCRIPTION="backport_dig is the backport of Hash#dig, Array#dig and OpenStruct#dig in Ruby 2.3 to older Ruby versions."
HOMEPAGE="https://github.com/koic/backport_dig"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RUBY_FAKEGEM_EXTRAINSTALL="ext"

each_ruby_configure(){
	${RUBY} ext/backport_dig/extconf.rb || die "extconf.rb failed"
}

each_ruby_compile(){
	emake || die "emake failed"
}

each_ruby_install(){
	emake DESTDIR="${D}" install || die "emake install failed"
	each_fakegem_install
}
