# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"

inherit eutils rpm versionator

DESCRIPTION="Web component of 1C ERP system"
HOMEPAGE="http://v8.1c.ru/"

MY_PV="$(replace_version_separator 3 '-' )"
MY_PN="1C_Enterprise82-ws"
SRC_URI="x86? ( ${MY_PN}-${MY_PV}.i386.rpm )
        amd64? ( ${MY_PN}-${MY_PV}.x86_64.rpm )"

SLOT="$(get_version_component_range 1-2)"
LICENSE="1CEnterprise_en"
KEYWORDS="amd64 x86"
RESTRICT="fetch strip"


RDEPEND="~app-office/1C_Enterprise-common-${PV}:${SLOT}"

DEPEND="${RDEPEND}"

#src_unpack() {
#	rpm_unpack ${DISTDIR}/${A}
#}

#src_compile() {
#	einfo "Компиляция не требуется. Устанавливаем..."
#}

src_install() {
	dodir /opt
	mv "${WORKDIR}"/opt/* ${D}/opt
}
