# Copyright 2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
GCONF_DEBUG="no"
WANT_AUTOCONF="2.5"

inherit autotools eutils gnome2

DESCRIPTION="Utility for measuring power usage."
HOMEPAGE="https://git.gnome.org/browse/gnome-battery-bench/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd ~x86-freebsd ~amd64-linux ~ia64-linux ~x86-linux"
IUSE=""

RDEPEND="
        app-text/asciidoc
        app-text/xmlto
"
DEPEND="${RDEPEND}
        virtual/pkgconfig
"
