# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} pypy3 )

inherit distutils-r1

DESCRIPTION="A pillow plugin that adds avif support via libavif"
HOMEPAGE="
	https://github.com/fdintino/pillow-avif-plugin/
	https://pypi.org/project/pillow-avif-plugin/
"
SRC_URI="
	https://github.com/fdintino/pillow-avif-plugin/archive/refs/tags/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="
	>=media-libs/libavif-0.10.1
	>=media-libs/libaom-3.3.0
	>=media-libs/dav1d-1.0.0
	>=media-libs/svt-av1-0.9.1
	>=media-video/rav1e-0.5.1
"
