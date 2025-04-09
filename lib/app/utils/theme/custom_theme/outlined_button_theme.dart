

import 'package:flutter/material.dart';

import '../../constants/color.dart';


class AppOutlinedButtonTheme{
  AppOutlinedButtonTheme._();
  static final lightOutlinedButtonThemeData = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.blue),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: AppColors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14), // Rounded corners
        ),
      )
  );
  static final darkOutlinedButtonThemeData = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        side: BorderSide(color: Colors.blueAccent),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14), // Rounded corners
        ),
      )
  );
}