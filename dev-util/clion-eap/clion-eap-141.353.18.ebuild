# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=5
inherit eutils
EAP='-EAP'
PVERSION='1.0'
HOMEPAGE="http://www.jetbrains.com/clion/"
DESCRIPTION="JetBrains C(C++) IDE EAP, Non free used, use license"

if [[ x${PVERSION} != 'x' ]]; then
	SRC_URI="http://download.jetbrains.com/cpp/clion-${PVERSION}.tar.gz"
	KEYWORDS="x86 amd64"
else
	KEYWORDS="~x86 ~amd64"
	SRC_URI="http://download.jetbrains.com/cpp/clion-${PVERSION:-${PV}}.tar.gz"
fi

PROGNAME="Clion"
RESTRICT="strip mirror"
DEPEND=">=virtual/jre-1.6"
SLOT="0"
S=${WORKDIR}
LICENSE="Apache-2.0"
src_install() {
	dodir /opt/${PN}

	cd clion*/
	insinto /opt/${PN}
	doins -r *

	fperms a+x /opt/${PN}/bin/clion.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "Chmod failed"
	dosym /opt/${PN}/bin/clion.sh /usr/bin/${PN}
	mv "bin/clion.svg" "bin/${PN}.svg"
	doicon "bin/${PN}.svg"
	make_desktop_entry ${PN} "${PROGNAME}" "${PN}"
}
pkg_postinst() {
	elog "Run /usr/bin/${PN}"
}
