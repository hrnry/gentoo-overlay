# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"

inherit ruby-fakegem bash-completion-r1

DESCRIPTION="Useful command line tool for Japanese battle heroine Pretty Cure (Precure)."
HOMEPAGE="https://github.com/greymd/cureutils"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bash-completion zsh-completion"

RDEPEND="zsh-completion? ( app-shells/zsh )"

ruby_add_rdepend "
	>=dev-ruby/activesupport-5.0.0
	>=dev-ruby/colorize-0.7.7 <dev-ruby/colorize-0.8.0
	>=dev-ruby/thor-0.19.1 <dev-ruby/thor-2
	>=dev-ruby/rubicure-1.3.0"

all_ruby_prepare() {
	sed -i -e '/rubicure/ s/~> 1.3.0/>= 1.3.0/' ${RUBY_FAKEGEM_GEMSPEC} || die "${RUBY_FAKEGEM_GEMSPEC} failed"
}

all_ruby_install() {
	use bash-completion && newbashcomp ${FILESDIR}/${PN}.bash-completion cure

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins zsh-completion/_cure
	fi

	all_fakegem_install
}
