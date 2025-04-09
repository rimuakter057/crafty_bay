
import 'package:crafty_bay/features/ui/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:crafty_bay/features/ui/screens/auth/verifyOtpScreen/verify_otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/ui/common/screens/main_bottom_nav_screen.dart';
import '../../../features/ui/screens/auth/sign_in_screen/sign_in_screen.dart';
import '../../../features/ui/screens/auth/splash_screen/splash_screen.dart';
import '../../../features/ui/screens/product/screens/product_details_screen.dart';
import '../../../features/ui/screens/product/screens/product_list_screen.dart';




class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print("➡️ Route requested: ${settings.name}");
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    } else if (settings.name == SignInScreen.name) {
      route = const SignInScreen();
    }else if (settings.name == SignUpScreen.name) {
      route = const SignUpScreen();
    }else if (settings.name == VerifyOtpScreen.name) {
      route = const VerifyOtpScreen();
    } else if (settings.name == MainBottomNavBarScreen.name) {
      route = const MainBottomNavBarScreen();
    } else if (settings.name == ProductListScreen.name) {
      final String category = settings.arguments as String;
      route = ProductListScreen(category: category);
    } else if (settings.name == ProductDetailsScreen.name) {
      route = const ProductDetailsScreen();
    }

    return MaterialPageRoute(builder: (context) {
        return route;
    /*    return Scaffold(
          body: Center(child: Text("no route defined for ${settings.name}")),
        );*/
      },
    );
  }
}