# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/l7-filter-userspace/l7-filter-userspace-0.11.ebuild,v 1.2 2010/07/18 02:47:57 dragonheart Exp $

EAPI="4"

WANT_AUTOCONF="2.5"

inherit eutils autotools

DESCRIPTION="Userspace utilities for layer 7 iptables QoS"
HOMEPAGE="http://l7-filter.clearfoundation.com/"
SRC_URI="mirror://sourceforge/l7-filter/${P}.tar.gz"

LICENSE="GPL-2"
KEYWORDS="~amd64 ~x86 ~arm"
IUSE=""
SLOT="0"
DEPEND=">=net-libs/libnetfilter_conntrack-0.0.100
		>=net-libs/libnetfilter_queue-1.0.0"
RDEPEND="net-misc/l7-protocols
		${DEPEND}"
DOCS=(README TODO BUGS THANKS AUTHORS sample-l7-filter.conf)

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