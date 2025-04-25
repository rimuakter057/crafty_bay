import 'package:crafty_bay/app/utils/routes/app_routes.dart';
import 'package:crafty_bay/app/utils/theme/theme.dart';
import 'package:crafty_bay/features/ui/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:crafty_bay/features/ui/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../features/ui/common/screens/main_bottom_nav_screen.dart';
import 'controller_binder.dart';




class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme:AppTheme.lightTheme,
      initialRoute: SignUpScreen.name,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      initialBinding: ControllerBinder(),
    );
  }
}