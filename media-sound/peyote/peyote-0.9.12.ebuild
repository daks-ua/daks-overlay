# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils

PYTHON_USE_WITH="threads ncurses"
NCURSES_USE_WITH="unicode"
PYTHON_DEPEND="2"

DESCRIPTION="Peyote is an audio player with friendly MC-like interface"
HOMEPAGE="http://peyote.sourceforge.net/"
MY_P="${PN}_${PV}"
SRC_URI="mirror://sourceforge/${PN}/${MY_P}.tar.bz2"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

IUSE="+inotify oss alsa jack pulse wavpack ogg mp3 lame flac pitch X"

DEPEND="media-libs/mutagen
    dev-python/pygobject
    dev-python/dbus-python
    inotify? ( dev-python/pyinotify )
    dev-python/gst-python:0.10
    media-libs/gst-plugins-base:0.10
    media-libs/gst-plugins-good:0.10
    sys-libs/ncurses

    X? ( || ( x11-terms/rxvt-unicode x11-terms/mrxvt x11-terms/xterm ) )
    oss? ( media-plugins/gst-plugins-oss:0.10 )
    pulse? ( media-plugins/gst-plugins-pulse:0.10 )
    jack? ( media-plugins/gst-plugins-jack:0.10 )
    alsa? ( media-plugins/gst-plugins-alsa:0.10 )


    pitch? ( media-plugins/gst-plugins-soundtouch:0.10 )
    flac? ( media-plugins/gst-plugins-flac:0.10 )
    lame? ( media-plugins/gst-plugins-lame:0.10 )
    ogg? ( media-plugins/gst-plugins-ogg:0.10 media-plugins/gst-plugins-vorbis:0.10 )
    wavpack? ( media-plugins/gst-plugins-wavpack:0.10 )
    mp3? ( media-plugins/gst-plugins-mad:0.10 )
"

RDEPEND="${DEPEND}"

S="${WORKDIR}/${MY_P}"
