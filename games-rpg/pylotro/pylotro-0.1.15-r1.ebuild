# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

PYTHON_DEPEND="2:2.5"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="2.4 3.*"

inherit games distutils

DESCRIPTION="Lord of the Rings Online and Dungeons & Dragons Online Launcher"
HOMEPAGE="http://www.lotrolinux.com/"
#SRC_URI="http://www.lotrolinux.com/PyLotRO-${PV}.zip"
SRC_URI="https://dl.dropbox.com/s/skbofnhzy5tcenc/PyLotRO-${PV}.zip"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/PyQt4"
RDEPEND="${DEPEND}"

S="${WORKDIR}/PyLotRO"

PYTHON_MODNAME=PyLotROLauncher
PYTHON_VERSIONED_SCRIPTS="${GAMES_BINDIR}/${PN}"

src_install() {
        distutils_src_install \
                --install-scripts "${GAMES_BINDIR}" \
                --install-data "${GAMES_DATADIR}"
        prepgamesdirs
}

pkg_postinst() {
        distutils_pkg_postinst
        games_pkg_postinst

        elog
        elog "You will need a proper wine or crossover-game installation to launch"
        elog "the game. You can find more information on how to run these games in"
        elog "Linux by visiting:"
        elog "http://appdb.winehq.org/objectManager.php?sClass=application&iId=4891"
        elog "or http://www.codeweavers.com/compatibility/browse/name/?app_id=4029"
}
