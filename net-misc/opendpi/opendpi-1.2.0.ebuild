# Copyright 2010 daks
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

DESCRIPTION="OpenDPI is a software component for traffic classification based on deep packet inspection."
HOMEPAGE="http://www.opendpi.org"
SRC_URI="http://opendpi.googlecode.com/files/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
DEPEND=">=sys-devel/libtool-2.2.6"
RDEPEND=""

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
