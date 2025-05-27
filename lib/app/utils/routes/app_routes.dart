import 'package:crafty_bay/features/ui/common/model/category_model.dart';
import 'package:crafty_bay/features/ui/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:crafty_bay/features/ui/screens/auth/verifyOtpScreen/verify_otp_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/ui/cart/ui/screens/cart_screen.dart';
import '../../../features/ui/common/screens/main_bottom_nav_screen.dart';
import '../../../features/ui/screens/auth/sign_in_screen/sign_in_screen.dart';
import '../../../features/ui/screens/auth/splash_screen/splash_screen.dart';
import '../../../features/ui/screens/brand/ui/screens/brandListScreen.dart';
import '../../../features/ui/screens/product/screens/new_product_list_screen.dart';
import '../../../features/ui/screens/product/screens/popular_product_list_screen.dart';
import '../../../features/ui/screens/product/screens/product_details_screen.dart';
import '../../../features/ui/screens/product/screens/product_list_screen.dart';
import '../../../features/ui/screens/product/screens/special_product_list_screen.dart';
import '../../../features/ui/screens/reviews/ui/screens/reviews_add_screen.dart';
import '../../../features/ui/screens/reviews/ui/screens/reviews_list_screen.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    print("route requested: ${settings.name}");
    late Widget route;
    if (settings.name == SplashScreen.name) {
      route = const SplashScreen();
    } else if (settings.name == SignInScreen.name) {
      route = const SignInScreen();
    } else if (settings.name == SignUpScreen.name) {
      route = const SignUpScreen();
    } else if (settings.name == VerifyOtpScreen.name) {
      String email = settings.arguments as String;
      route = VerifyOtpScreen(email: email);
    } else if (settings.name == MainBottomNavBarScreen.name) {
      route = const MainBottomNavBarScreen();
    } else if (settings.name == ProductListScreen.name) {
      final category = settings.arguments as CategoryModel;
      route = ProductListScreen(category: category);
    } else if (settings.name == ProductDetailsScreen.name) {
      final productId = settings.arguments as String;
      route = ProductDetailsScreen(productId: productId);
    } else if (settings.name == ReviewsAddScreen.name) {
      final productId = settings.arguments as String;
      route = ReviewsAddScreen(productId: productId);
    } else if (settings.name == ReviewsListScreen.name) {
      final productId = settings.arguments as String;
      route = ReviewsListScreen(productId: productId);
    } else if (settings.name == BrandsListScreen.name) {
      route = const BrandsListScreen();
    } else if (settings.name == PopularProductListScreen.name) {
      route = const PopularProductListScreen();
    } else if (settings.name == SpecialProductListScreen.name) {
      route = const SpecialProductListScreen();
    } else if (settings.name == NewProductListScreen.name) {
      route = const NewProductListScreen();
    } else if (settings.name == CartListScreen.name) {
      route = const CartListScreen();
    }

    return MaterialPageRoute(
      builder: (context) {
        return route;
        /*    return Scaffold(
          body: Center(child: Text("no route defined for ${settings.name}")),
        );*/
      },
    );
  }
}
