# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

DESCRIPTION="Programmable Completion for zsh (includes emerge and ebuild commands)"
HOMEPAGE="http://gentoo.org"
EGIT_REPO_URI="git://github.com/zsh-users/zsh-completions"

LICENSE="ZSH"
SLOT="0"
KEYWORDS=""
IUSE="+ack +adb +ag +android +artisan +atach +baselayout +bpython +brew +bundle
	+cabal +cap +celery +choc +coffee +composer +console +cpanm +debuild
	+dget +dhcpcd +ditz +docpad +dzen2 +emulator +envoy +eselect +exportfs
	+fab +gas +gcc-config +geany +gem +genlop +gentoolkit +gist
	+git-flow +git-pulls +git-wtf +github +glances +google +gradle +heroku
	+httpie +id3 +id3v2 +iw +jekyll +jmeter +jmeter-plugins +jonas +jq
	+kitchen +knife +layman +lein +logger +lunar +lunchy
	+manage.py +middleman +mina +mosh +mpv +mussh +mvn +node +nvm +optirun
	+pactree +pass +pear +perf +periscope +phing +pip +pkcon +play
	+port +portage +portage +primus +ps +pygmentize +rails +ralio +redis-cli
	+rubocop +rvm +salt +sbt +scala +sdd +setup.py +showoff +shutdown
	+smartmontools +socat +srm +ssh-copy-id +subliminal +svm +symfony
	+teamocil +thor +tmuxinator +vagrant +veewee +virtualbox +vnstat
	+vpnc +wemux +xinput +yaourt +zfs"

DEPEND="app-shells/zsh"
RDEPEND="${DEPEND}"

DOCS="README.md"

src_install() {
	insinto /usr/share/zsh/site-functions

	use ack && doins src/_ack
	use adb && doins src/_adb
	use ag && doins src/_ag
	use android && doins src/_android
	use artisan && doins src/_artisan
	use atach && doins src/_atach
	use baselayout && doins src/_baselayout
	use bpython && doins src/_bpython
	use brew && doins src/_brew
	use bundle && doins src/_bundle
	use cabal && doins src/_cabal
	use cap && doins src/_cap
	use celery && doins src/_celery
	use choc && doins src/_choc
	use coffee && doins src/_coffee
	use composer && doins src/_composer
	use console && doins src/_console
	use cpanm && doins src/_cpanm
	use debuild && doins src/_debuild
	use dget && doins src/_dget
	use dhcpcd && doins src/_dhcpcd
	use ditz && doins src/_ditz
	use docpad && doins src/_docpad
	use dzen2 && doins src/_dzen2
	use emulator && doins src/_emulator
	use envoy && doins src/_envoy
	use eselect && doins src/_eselect
	use exportfs && doins src/_exportfs
	use fab && doins src/_fab
	use gas && doins src/_gas
	use gcc-config && doins src/_gcc-config
	use geany && doins src/_geany
	use gem && doins src/_gem
	use genlop && doins src/_genlop
	use gentoolkit && doins src/_gentoolkit
	use gist && doins src/_gist
	use git-flow && doins src/_git-flow
	use git-pulls && doins src/_git-pulls
	use git-wtf && doins src/_git-wtf
	use github && doins src/_github
	use glances && doins src/_glances
	use google && doins src/_google
	use gradle && doins src/_gradle
	use heroku && doins src/_heroku
	use httpie && doins src/_httpie
	use id3 && doins src/_id3
	use id3v2 && doins src/_id3v2
	use iw && doins src/_iw
	use jekyll && doins src/_jekyll
	use jmeter && doins src/_jmeter
	use jmeter-plugins && doins src/_jmeter-plugins
	use jonas && doins src/_jonas
	use jq && doins src/_jq
	use kitchen && doins src/_kitchen
	use knife && doins src/_knife
	use layman && doins src/_layman
	use lein && doins src/_lein
	use logger && doins src/_logger
	use lunar && doins src/_lunar
	use lunchy && doins src/_lunchy
	use manage.py && doins src/_manage.py
	use middleman && doins src/_middleman
	use mina && doins src/_mina
	use mosh && doins src/_mosh
	use mpv && doins src/_mpv
	use mussh && doins src/_mussh
	use mvn && doins src/_mvn
	use node && doins src/_node
	use nvm && doins src/_nvm
	use optirun && doins src/_optirun
	use pactree && doins src/_pactree
	use pass && doins src/_pass
	use pear && doins src/_pear
	use perf && doins src/_perf
	use periscope && doins src/_periscope
	use phing && doins src/_phing
	use pip && doins src/_pip
	use pkcon && doins src/_pkcon
	use play && doins src/_play
	use port && doins src/_port
	use portage && doins src/_portage
	use portage && doins src/_portage
	use primus && doins src/_primus
	use ps && doins src/_ps
	use pygmentize && doins src/_pygmentize
	use rails && doins src/_rails
	use ralio && doins src/_ralio
	use redis-cli && doins src/_redis-cli
	use rubocop && doins src/_rubocop
	use rvm && doins src/_rvm
	use salt && doins src/_salt
	use sbt && doins src/_sbt
	use scala && doins src/_scala
	use sdd && doins src/_sdd
	use setup.py && doins src/_setup.py
	use showoff && doins src/_showoff
	use shutdown && doins src/_shutdown
	use smartmontools && doins src/_smartmontools
	use socat && doins src/_socat
	use srm && doins src/_srm
	use ssh-copy-id && doins src/_ssh-copy-id
	use subliminal && doins src/_subliminal
	use svm && doins src/_svm
	use symfony && doins src/_symfony
	use teamocil && doins src/_teamocil
	use thor && doins src/_thor
	use tmuxinator && doins src/_tmuxinator
	use vagrant && doins src/_vagrant
	use veewee && doins src/_veewee
	use virtualbox && doins src/_virtualbox
	use vnstat && doins src/_vnstat
	use vpnc && doins src/_vpnc
	use wemux && doins src/_wemux
	use xinput && doins src/_xinput
	use yaourt && doins src/_yaourt
	use zfs && doins src/_zfs
}

pkg_postinst() {
	elog
	elog "If you happen to compile your functions, you may need to delete"
	elog "~/.zcompdump{,.zwc} and recompile to make zsh-completion available"
	elog "to your shell."
	elog
}
