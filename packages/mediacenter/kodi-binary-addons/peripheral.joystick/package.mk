# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Lukas Rusak (lrusak@libreelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="peripheral.joystick"
PKG_VERSION="1.5.0-Leia"
PKG_SHA256="051a14b53376be63f5b123b903fce023041b7cc3ba924ccf4c679dcfe1f7f06b"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/masQelec/peripheral.joystick"
PKG_URL="https://github.com/masQelec/peripheral.joystick/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform p8-platform"
PKG_SECTION=""
PKG_SHORTDESC="peripheral.joystick: Joystick support in Kodi"
PKG_LONGDESC="peripheral.joystick provides joystick support and button mapping"
PKG_BUILD_FLAGS="+lto"

PKG_IS_ADDON="embedded"
PKG_ADDON_TYPE="kodi.peripheral"
