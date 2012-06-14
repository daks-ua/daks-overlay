# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

MY_R=eter2.1gentoo
MY_ARCH=i586
DESCRIPTION="PostgreSQL client programs and libraries (Etersoft edition for Selta and 1C)"
HOMEPAGE=http://www.postgresql.org/
RESTRICT="mirror"

BASE_URI="ftp://updates.etersoft.ru/pub/Etersoft/Postgres@Etersoft/8.3.8/Gentoo/2009"
SRC_URI="$BASE_URI/extra/postgresql-8.3eter-test-8.3.8-eter2.1gentoo.i586.tar.bz2 \
    $BASE_URI/postgresql-8.3eter-server-8.3.8-eter2.1gentoo.i586.tar.bz2 \
    $BASE_URI/extra/postgresql-8.3eter-plpython-8.3.8-eter2.1gentoo.i586.tar.bz2 \
    $BASE_URI/extra/postgresql-8.3eter-plperl-8.3.8-eter2.1gentoo.i586.tar.bz2 \
    $BASE_URI/extra/postgresql-8.3eter-docs-8.3.8-eter2.1gentoo.i586.tar.bz2 \
    $BASE_URI/postgresql-8.3eter-contrib-8.3.8-eter2.1gentoo.i586.tar.bz2 \
    $BASE_URI/postgresql-8.3eter-8.3.8-eter2.1gentoo.i586.tar.bz2"

LICENSE=BSD
SLOT="0"
KEYWORDS="-* x86 amd64"
IUSE=""

#src_unpack() {
#unpack ${A}
#}

src_install() {
cp -pR * "${D}"
}
