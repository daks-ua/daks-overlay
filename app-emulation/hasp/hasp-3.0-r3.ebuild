# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit eutils flag-o-matic rpm

DESCRIPTION="Hardware Against Software Piracy for access to parallel and usb keys"
HOMEPAGE="http://www.etersoft.ru"
SRC_URI="ftp://updates.etersoft.ru/pub/Etersoft/WINE@Etersoft/last/sources/haspd-${PV}-alt${PR#r}.src.rpm"
LICENSE="Proprietary"
SLOT="0"
KEYWORDS="-* ~x86"
IUSE="net_hasp wine"

RDEPEND=">=app-emulation/hasp-par-1.7-r3"
DEPEND="${RDEPEND}"

pkg_preinst() {
    if [ ! -f /proc/bus/usb/devices ]; then
        eerror "Check kernel for CONFIG_USB_DEVICEFS... "
        if [ ! -d /proc/bus/usb ] ; then
                eerror "You have to use kernel with CONFIG_USB_DEVICEFS enabled"
                die "You have to mount usbfs (usbdevfs) filesystem into /proc/bus/usb, f.i.: mount -t usbfs none /proc/bus/usb"

        fi
    fi

}

src_unpack() {
	rpm_unpack ${DISTDIR}/${A} 
	cd ${WORKDIR}
	tar -xjf haspd-${PV}.tar.bz2
}


src_install() {
	dodir "/usr/sbin"
	dodir "/etc/init.d"
	cd ${WORKDIR}/haspd-${PV}/aksusbd
	dosbin aksusbd
	dosbin ${WORKDIR}/haspd-${PV}/hasptest/haspdemo
	use wine &&	{ 
					dosbin ${WORKDIR}/haspd-${PV}/winehasp/winehasp
	    			newinitd "${FILESDIR}"/winehasp.init winehasp
				}
	newinitd "${FILESDIR}"/aksusbd.init aksusbd

	use net_hasp && {
		dodir "/etc/haspd"
		dodir "/etc/conf.d"
		cp "${WORKDIR}"/haspd-${PV}/hasplm/hasplm.conf ${D}/etc/haspd/
		cp "${FILESDIR}"/hasplm.conf ${D}/etc/conf.d/hasplm
		cp "${FILESDIR}"/hasplmd.conf ${D}/etc/conf.d/hasplmd
		dosbin ${WORKDIR}/haspd-${PV}/hasplm/hasplm
		dosbin ${WORKDIR}/haspd-${PV}/hasplmd/hasplmd
		dosbin ${WORKDIR}/haspd-${PV}/hasptest/nethaspdemo
	    newinitd "${FILESDIR}"/hasplm.init-8.30 hasplm
	    newinitd "${FILESDIR}"/hasplmd.init hasplmd
	}
}
