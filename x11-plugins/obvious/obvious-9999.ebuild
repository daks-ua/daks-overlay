# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit git-2

DESCRIPTION="Set of widgets for x11-wm/awesome that provide helpful information"
HOMEPAGE="https://awesome.naquadah.org/wiki/Obvious"
EGIT_REPO_URI="git://git.mercenariesguild.net/obvious.git"

unset EGIT_MASTER EGIT_BRANCH EGIT_COMMIT
if [[ ${PV} == *9999* ]]; then
	KEYWORDS=""
else
	KEYWORDS="~amd64 ~x86"
	EGIT_COMMIT="v${PV}"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND=""
#RDEPEND="=x11-wm/awesome-${PV}"
RDEPEND="x11-wm/awesome"

src_unpack() {
	git-2_src_unpack
}

src_install() {
	dodoc README TODO || die "dodoc failed"
	insinto /usr/share/awesome/lib/obvious
	doins -r basic_mpd battery bluetooth clock cpu fs_usage gps io keymap_switch lib loadavg mem net \
	    popup_run_prompt temp_info umts volume_alsa volume_freebsd wlan init.lua || die "Install failed"
}
