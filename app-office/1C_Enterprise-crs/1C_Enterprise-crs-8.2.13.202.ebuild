# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="3"

inherit eutils rpm versionator

DESCRIPTION="Компоненты сервера Хранилища Конфигурации 1С:Предприятие 8.1"
HOMEPAGE="http://v8.1c.ru/"

MY_PV="$(replace_version_separator 3 '-' )"
MY_PN="1C_Enterprise82-crs"

SRC_URI="x86? ( ${MY_PN}-${MY_PV}.i386.rpm )"

SLOT="$(get_version_component_range 1-2)"
LICENSE="1C"
KEYWORDS="x86"
RESTRICT="fetch strip"


RDEPEND="~app-office/1C_Enterprise-common-${PV}:${SLOT}
	~app-office/1C_Enterprise-server-${PV}:${SLOT}
	~app-office/1C_Enterprise-ws-${PV}:${SLOT}"

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
