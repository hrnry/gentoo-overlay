# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23"

inherit ruby-fakegem bash-completion-r1

DESCRIPTION="Useful command line tool for Japanese battle heroine Pretty Cure (Precure)."
HOMEPAGE="https://github.com/greymd/cureutils"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+bash-completion zsh-completion"

RDEPEND="
	zsh-completion? ( app-shells/zsh )
	ruby_targets_ruby22? ( dev-ruby/backport_dig )"

ruby_add_rdepend "
	>=dev-ruby/activesupport-5.0.0
	>=dev-ruby/colorize-0.7.7 <dev-ruby/colorize-0.8.0
	>=dev-ruby/thor-0.19.1 <dev-ruby/thor-2
	>=dev-ruby/rubicure-1.0.0 <dev-ruby/rubicure-1.1.0"

all_ruby_install() {
	use bash-completion && newbashcomp ${FILESDIR}/${PN}.bash-completion cure

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions
		doins zsh-completion/_cure
	fi

	all_fakegem_install
}
