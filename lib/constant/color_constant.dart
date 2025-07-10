import 'dart:math';

import 'package:flutter/material.dart';

class ColorConstant {
  static final primary = ColorConstant.hexToColor('#FDDC01');
  static final primaryButton = ColorConstant.hexToColor('#FA275A');
  static final primaryTextHome = ColorConstant.hexToColor('#2BADD9');
  static final primaryDark = ColorConstant.hexToColor('#17D0FF');
  static final primaryLight = hexToColor('#FFFFFF');
  static final primaryCardtwo = ColorConstant.hexToColor('#F2FBFF');
  static final primaryCardOne = ColorConstant.hexToColor('#D2F6FF');
  static final primaryCardThree = ColorConstant.hexToColor('#E4F9FF');
  static final formDisable = ColorConstant.hexToColor('#E4E5ED');

  static final formAuth = hexToColor("#FFF0F1");

  static final black80 = hexToColor("#303030");

  static final red60 = hexToColor('#DE1B1B');
  static final red50 = hexToColor('#FAF0F0');

  static final red80 = hexToColor('#C5122D');

  static final yellow80 = hexToColor('#F59F00');
  static final yellow10 = hexToColor('#FFF9DB');

  static final yellow40 = hexToColor('#FBF4E9');

  static final orange80 = hexToColor('#FB8B2D');
  static final orange10 = hexToColor('#DD7E2D');

  static final green80 = hexToColor('#74B816');
  static final green10 = hexToColor('#F4FCE3');
  static final green50 = hexToColor('#F2F8ED');
  static final green70 = hexToColor('#11B170');

  static final sky50 = hexToColor('#229BD8');
  static final sky10 = hexToColor('#EDF4F7');
  static final blue087EF8 = hexToColor('#087EF8');

  static final grey100 = hexToColor('#000000');
  static final grey90 = hexToColor('#404040');
  static final grey80 = hexToColor('#757575');
  static final grey70 = hexToColor('#757575');
  static final grey60 = hexToColor('#9E9E9E');
  static final grey50 = hexToColor('#BDBDBD');
  static final grey40 = hexToColor('#E0E0E0');
  static final grey30 = hexToColor('#EEEEEE');
  static final grey20 = hexToColor('#F5F5F5');
  static final grey05 = hexToColor('#F3F3F3');
  static final grey10 = hexToColor('#FAFAFA');
  static final grey0 = hexToColor('#FFFFFF');

  static final greyForm = hexToColor('#F0F2F7');
  static final greyFormNew = hexToColor('#F7F9FA');

  static Color hexToColor(String hex) {
    assert(
      RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
      'hex color must be #rrggbb or #rrggbbaa',
    );

    return Color(
      int.parse(hex.substring(1), radix: 16) +
          (hex.length == 7 ? 0xff000000 : 0x00000000),
    );
  }

  static int randHex() {
    Random random = Random();
    double randomDouble = random.nextDouble();
    return (randomDouble * 0xFFFFFF).toInt();
  }

  static Color generateRandomColor({int? hex, double opacity = 1.0}) {
    return Color(hex ?? randHex()).withOpacity(opacity);
  }
}
