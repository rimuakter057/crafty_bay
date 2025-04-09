

import 'package:flutter/material.dart';

class AppTextTheme{
  AppTextTheme._();
  static TextTheme lightTextTheme =  TextTheme(
    headlineLarge: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 32.0,fontWeight: FontWeight.bold,color: Colors.black),
    headlineMedium: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 24.0,fontWeight: FontWeight.w600,color: Colors.black),
    headlineSmall: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 18.0,fontWeight: FontWeight.w600,color: Colors.black),


    titleLarge: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.black),
    titleMedium: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 16.0,fontWeight: FontWeight.w500,color: Colors.black),
    titleSmall: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 16.0,fontWeight: FontWeight.w400,color: Colors.black),

   bodyLarge: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.black),
    bodyMedium: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 14.0,fontWeight: FontWeight.normal,color: Colors.black),
    bodySmall: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.black38),

    labelLarge: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 12.0,fontWeight: FontWeight.normal,color: Colors.black),
    labelMedium: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 12.0,fontWeight: FontWeight.w500,color: Colors.black38),

  );
  static TextTheme darkTextTheme =  TextTheme(
    headlineLarge: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 32.0,fontWeight: FontWeight.bold,color: Colors.white),
    headlineMedium: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 24.0,fontWeight: FontWeight.w600,color: Colors.white),
    headlineSmall: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 18.0,fontWeight: FontWeight.w600,color: Colors.white),


    titleLarge: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 16.0,fontWeight: FontWeight.w600,color: Colors.white),
    titleMedium: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 16.0,fontWeight: FontWeight.w500,color: Colors.white),
    titleSmall: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 16.0,fontWeight: FontWeight.w400,color: Colors.white),

    bodyLarge: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.white),
    bodyMedium: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 14.0,fontWeight: FontWeight.normal,color: Colors.white),
    bodySmall: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.white70),

    labelLarge: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 12.0,fontWeight: FontWeight.normal,color: Colors.white),
    labelMedium: const TextStyle().copyWith(fontFamily: 'Poppins',fontSize: 12.0,fontWeight: FontWeight.w500,color: Colors.white70),

  );
}