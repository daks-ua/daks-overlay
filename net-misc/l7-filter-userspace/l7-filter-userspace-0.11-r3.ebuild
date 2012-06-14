# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

WANT_AUTOCONF="2.5"

inherit eutils

DESCRIPTION="Userspace utilities for layer 7 iptables QoS"
HOMEPAGE="http://l7-filter.clearfoundation.com/"
SRC_URI="mirror://sourceforge/l7-filter/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86"
IUSE=""
SLOT="0"
DEPEND=">=net-libs/libnetfilter_conntrack-0.0.100
		>=net-libs/libnetfilter_queue-1.0.0"
RDEPEND="net-misc/l7-protocols
		${DEPEND}"
DOCS=( README TODO BUGS THANKS AUTHORS sample-l7-filter.conf )

CONFIG_CHECK="~NF_CT_NETLINK"

src_prepare() {
	epatch "${FILESDIR}/${P}-libnetfilter_conntrack-0.0.100.patch" \
		"${FILESDIR}/${P}-datatype.patch" \
		"${FILESDIR}/${P}-map-access-threadsafe.patch" \
		"${FILESDIR}/${P}-arm-ppc-getopt-help-fix.patch" \
		"${FILESDIR}/${P}-pattern-loading-leak.patch"
}

src_install() {
	default
	emake DESTDIR="${D}" install || die
}
