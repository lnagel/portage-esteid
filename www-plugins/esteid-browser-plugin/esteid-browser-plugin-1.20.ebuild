# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"

inherit multilib nsplugins subversion

ESVN_REPO_URI="https://svn.eesti.ee/projektid/idkaart_public/branches/3.6/esteid-plugin/"
ESVN_PROJECT="esteid-plugin"

DESCRIPTION="Estonian ID card digital signing browser plugin"
HOMEPAGE="http://id.ee/"
LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	x11-libs/gtk+:2"

RDEPEND="${DEPEND}
	app-crypt/ccid
	dev-libs/opensc"

src_compile() {
	emake plugin || die "emake plugin failed"
}

src_install() {
	dolib npesteid-firefox-plugin.so || die
	inst_plugin "/usr/$(get_libdir)/npesteid-firefox-plugin.so" || die
}
