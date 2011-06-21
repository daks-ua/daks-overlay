# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils linux-mod

DESCRIPTION="Driver for the RaLink RT2870 USB wireless chipsets"
HOMEPAGE="http://www.ralinktech.com/support.php?s=2"
LICENSE="GPL-2"

RESTRICT="bindist fetch mirror"

MY_P="2010_0709_RT2870_Linux_STA"

SRC_URI="${MY_P}_v${PV}.tar.bz2"

KEYWORDS="-* ~amd64 x86"
IUSE="debug"
SLOT="0"

DEPEND=""
RDEPEND="net-wireless/wireless-tools"

S="${WORKDIR}/${MY_P}_v${PV}"
MODULE_NAMES="rt2870sta(net:${S}:${S}/os/linux)"
BUILD_TARGETS=" "
MODULESD_RT2870STA_ALIASES=('ra? rt2870sta')
MODULESD_RT2870STA_ADDITIONS=('blacklist rt2800usb')

#CONFIG_CHECK="WIRELESS_EXT USB"
#ERROR_WIRELESS_EXT="${P} requires support for Wireless LAN drivers (non-hamradio) & Wireless Extensions (CONFIG_WIRELESS_EXT). Starting with kernels 2.6.33 it is not possible to select WIRELESS_EXT anymore, so you need to enable a wireless driver that enables CONFIG_WIRELESS_EXT, for example PRISM54 or IPW2200"
#ERROR_USB="You need to enable USB support (CONFIG_USB) in your kernel to use usb support in ${P}."

pkg_nofetch() {
	elog "Please download the tar.bz2 source named:"
	elog "RT2870USB(RT2870/RT2770) version 2.4.0.1 from:"
	elog "http://www.ralinktech.com/support.php?s=2"
	elog "Then put the file in ${DISTDIR}/${SRC_URI}"
}

src_compile() {
	epatch ${FILESDIR}/${P}-usb_alloc_free.patch
	epatch ${FILESDIR}/${P}-unified.patch
	kernel_is ge 2 6 37 && epatch ${FILESDIR}/${P}-netif_stop_queue.patch
	use debug || epatch ${FILESDIR}/${P}-nodebug.patch

	linux-mod_src_compile
}

src_install() {
	linux-mod_src_install

	dodoc README_STA iwpriv_usage.txt sta_ate_iwpriv_usage.txt "LICENSE ralink-firmware.txt"
	insinto /etc/Wireless/RT2870STA
	insopts -m 0600
	doins RT2870STA.dat
	doins RT2870STACard.dat
	insinto /$(get_libdir)/firmware
	insopts -m 0644
	doins common/rt2870.bin
}

pkg_postinst() {
	linux-mod_pkg_postinst

	einfo
	einfo "Thanks to RaLink for releasing open drivers!"
	einfo
	einfo "The staging 'rt2800usb' kernel driver has been auto blacklisted."
	einfo "If you want to use it again, blacklist this driver ('rt2870sta')"
	einfo "and allow the 'rt2800usb' one."
	einfo
}

