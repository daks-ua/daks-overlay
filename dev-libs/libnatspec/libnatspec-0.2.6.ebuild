# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="The charsets and locales API library."
HOMEPAGE="http://sourceforge.net/projects/natspec/"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"

SLOT="0"
LICENSE="LGPL-2"
KEYWORDS="x86 ~amd64"
IUSE=""

DEPEND="sys-libs/glibc
		dev-libs/popt"
RDEPEND="${DEPEND}"

src_install() {

	make DESTDIR="${D}" install
}
