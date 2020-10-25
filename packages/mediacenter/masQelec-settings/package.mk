# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present masQelec

PKG_NAME="masQelec-settings"
PKG_VERSION="507c386ec3128e25dd56c930314dbb84887311e6"
PKG_SHA256="560f65a466bb7720b75d94e488f1fc0e5fca1e89713cf9cfbd147128246c93fe"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL="https://github.com/masQelec/service.masqelec.settings/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 connman pygobject dbus-python"
PKG_LONGDESC="masQelec-settings: is a settings dialog for masQelec"

PKG_MAKE_OPTS_TARGET="DISTRONAME=$DISTRONAME ROOT_PASSWORD=$ROOT_PASSWORD"

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET setxkbmap"
else
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bkeymaps"
fi

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/coreelec
    cp $PKG_DIR/scripts/* $INSTALL/usr/lib/coreelec

  ADDON_INSTALL_DIR=$INSTALL/usr/share/kodi/addons/service.masqelec.settings

  $TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/resources/lib/ -f
  rm -rf $(find $ADDON_INSTALL_DIR/resources/lib/ -name "*.py")

  $TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/oe.py -f
  rm -rf $ADDON_INSTALL_DIR/oe.py
}

post_install() {
  enable_service backup-restore.service
  enable_service factory-reset.service
}
