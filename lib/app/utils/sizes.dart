import 'package:flutter/material.dart';

class AppSizes {
  ///screen size
  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double logoW(BuildContext context) => screenWidth(context) * 0.3;

  /// Font sizes
  static double fontSizeSm(BuildContext context) => screenWidth(context) * 0.03;
  static double fontSizeMd(BuildContext context) =>
      screenWidth(context) * 0.035;
  static double fontSizeLg(BuildContext context) => screenWidth(context) * 0.05;

  // Button sizes
  static double buttonHeight(BuildContext context) =>
      screenHeight(context) * 0.05;
  static double buttonRadius(BuildContext context) =>
      screenWidth(context) * 0.03;
  static double buttonWidth(BuildContext context) => screenWidth(context) * 0.3;
  static double buttonElevation(BuildContext context) =>
      screenWidth(context) * 0.02;

  /// Default spacing
  static double defaultPadding(BuildContext context) =>
      screenWidth(context) * 0.06;
  static double spaceBthItems(BuildContext context) =>
      screenHeight(context) * 0.018;
  static double spaceBthSections(BuildContext context) =>
      screenHeight(context) * 0.04;
  static double spaceBtwItems(BuildContext context) =>
      screenWidth(context) * 0.018;
  static double spaceWTwoItems(BuildContext context) =>
      screenWidth(context) * 0.08;

  /// Divider height
  static double dividerHeight(BuildContext context) =>
      screenHeight(context) * 0.001;
}
