



import 'package:flutter/material.dart';

import '../../constants/color.dart';


class MyAppBarTheme{
  MyAppBarTheme._();
  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme:IconThemeData(color: AppColors.black,size: 24.0),
    actionsIconTheme:IconThemeData(color: AppColors.black,size: 24.0),
    titleTextStyle:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,color: Colors.black)

  );
  static final darkAppBarTheme = AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme:IconThemeData(color: AppColors.black,size: 24.0),
      actionsIconTheme:IconThemeData(color: AppColors.white,size: 24.0),
      titleTextStyle:TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600,color: AppColors.textWhite)

  );
}