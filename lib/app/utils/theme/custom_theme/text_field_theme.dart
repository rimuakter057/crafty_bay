


import 'package:flutter/material.dart';

import '../../constants/color.dart';


class AppTextFormFieldTheme{
  AppTextFormFieldTheme._();
 static final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
  prefixIconColor: AppColors.grey,
  suffixIconColor: AppColors.grey,
  labelStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.black), // লেবেল টেক্সট কালার
  hintStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.black), // হিন্ট টেক্সট কালার
  errorStyle: const TextStyle().copyWith(fontWeight: FontWeight.normal),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: AppColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: AppColors.grey),
    ),
  focusedBorder:const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(14),
    borderSide: const BorderSide(width: 1,color: Colors.black12),
  ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2,color: Colors.orange),
    ),

  );
 static  final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: AppColors.grey,
    suffixIconColor: AppColors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.black), // লেবেল টেক্সট কালার
    hintStyle: const TextStyle().copyWith(fontSize: 14,color: AppColors.black), // হিন্ট টেক্সট কালার
    errorStyle: const TextStyle().copyWith(fontWeight: FontWeight.normal),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: AppColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: AppColors.grey),
    ),
    focusedBorder:const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1,color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2,color: Colors.orange),
    ),
  );
}