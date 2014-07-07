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
	+fab +gas +gcc-config +geany +gem +genlop +gentoolkit +gentoo_packages +gist
	+git-flow +git-pulls +git-wtf +github +glances +google +gradle +heroku
	+httpie +id3 +id3v2 +iw +jekyll +jmeter +jmeter-plugins +jonas +jq
	+kitchen +knife +language_codes +layman +lein +logger +lunar +lunchy
	+manage.py +middleman +mina +mosh +mpv +mussh +mvn +node +nvm +optirun
	+pactree +pass +pear +perf +periscope +phing +pip +pkcon +play
	+port +portage +portage_utils +pgsql_utils +primus +ps +pygmentize
	+rails +ralio +redis-cli +rubocop +rvm +salt +sbt +scala +sdd
	+setup.py +showoff +shutdown +smartmontools +socat +srm +ssh-copy-id
	+subliminal +svm +symfony +teamocil +thor +tmuxinator +vagrant +veewee
	+virsh +virtualbox +vnstat +vpnc +wemux +xinput +yaourt +zfs"

DEPEND="app-shells/zsh"
RDEPEND="${DEPEND}"

src_install() {
	insinto /usr/share/zsh/site-functions
	for i in ${IUSE[@]}; do
		use "${i##\+}" && doins src/_"${i##\+}"
	done
	dodoc README.md
}

pkg_postinst() {
	elog
	elog "If you happen to compile your functions, you may need to delete"
	elog "~/.zcompdump{,.zwc} and recompile to make zsh-completion available"
	elog "to your shell."
	elog
}
