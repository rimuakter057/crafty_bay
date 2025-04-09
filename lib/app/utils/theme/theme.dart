
import 'package:crafty_bay/app/utils/constants/color.dart';
import 'package:flutter/material.dart';
import 'custom_theme/appbar_theme.dart';
import 'custom_theme/bottom_sheet_theme.dart';
import 'custom_theme/check_box_theme.dart';
import 'custom_theme/chip_theme.dart';
import 'custom_theme/elevated_button_theme.dart';
import 'custom_theme/outlined_button_theme.dart';
import 'custom_theme/text_field_theme.dart';
import 'custom_theme/text_theme.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(

    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
      primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextTheme.lightTextTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.lightElevatedButtonThemeData,
    outlinedButtonTheme: AppOutlinedButtonTheme.lightOutlinedButtonThemeData,
    checkboxTheme: AppCheckBoxTheme.lightCheckBoxTheme,
    bottomSheetTheme: AppBottomSheetTheme.lightBottomSheetTheme,
    chipTheme: AppChipTheme.lightChipThemeData,
    appBarTheme: MyAppBarTheme.lightAppBarTheme,
    inputDecorationTheme: AppTextFormFieldTheme.lightInputDecorationTheme
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextTheme.darkTextTheme,
      elevatedButtonTheme: AppElevatedButtonTheme.darkElevatedButtonThemeData,
      outlinedButtonTheme: AppOutlinedButtonTheme.darkOutlinedButtonThemeData,
      checkboxTheme: AppCheckBoxTheme.darkCheckBoxTheme,
      bottomSheetTheme: AppBottomSheetTheme.darkBottomSheetTheme,
      chipTheme: AppChipTheme.darkChipThemeData,
      appBarTheme: MyAppBarTheme.darkAppBarTheme,
      inputDecorationTheme: AppTextFormFieldTheme.darkInputDecorationTheme
  );
}