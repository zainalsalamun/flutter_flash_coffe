import 'package:flutter/material.dart';
import 'package:flutter_flash_coffe/constant/color_constant.dart';

class DefaultTheme {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    unselectedWidgetColor: ColorConstant.grey50,
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData().copyWith(
        size: 16,
        color: ColorConstant.grey70,
      ),
    ),
    iconTheme: const IconThemeData().copyWith(
      size: 16,
      color: ColorConstant.grey70,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        backgroundColor: WidgetStateProperty.all(ColorConstant.primary),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
      backgroundColor: ColorConstant.primary,
    ),
    radioTheme: const RadioThemeData().copyWith(
      fillColor: WidgetStateProperty.all(ColorConstant.primary),
    ),
    checkboxTheme: const CheckboxThemeData().copyWith(
      fillColor: WidgetStateProperty.all(ColorConstant.primary),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme().copyWith(
      backgroundColor: Colors.blue.shade700,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
        backgroundColor: WidgetStateProperty.all(Colors.blue.shade700),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData().copyWith(
      backgroundColor: Colors.blue.shade700,
    ),
  );
}
