# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5
inherit eutils
#EAP='-EAP'
#PVERSION='1.0.3'
HOMEPAGE="http://nim-lang.org/"
DESCRIPTION="Nim (formerly known as \"Nimrod\") is a statically typed, imperative programming language."

SRC_URI="http://nim-lang.org/download/nim-${PV}.tar.xz"
KEYWORDS="~x86 ~amd64"

PROGNAME="Nim"
RESTRICT="strip mirror"
SLOT="0"
S=${WORKDIR}
LICENSE="Apache-2.0"

src_compile() {
	cd "${S}/${P}"
	sh build.sh
}

src_install() {
	cd "${S}/${P}"
	sh install.sh /usr/bin
}
