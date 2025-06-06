import 'package:crafty_bay/features/ui/data/auth/controller/auth_controller.dart';
import 'package:crafty_bay/features/ui/common/controllers/home_slider_controller.dart';
import 'package:crafty_bay/features/ui/data/auth/controller/sign_up_controller.dart';
import 'package:crafty_bay/features/ui/common/controllers/category_controller.dart';
import 'package:get/get.dart';

import '../core/network_caller/network_caller.dart';
import '../features/ui/cart/ui/controller/product_cart_controller.dart';
import '../features/ui/common/controllers/main_bottom_nav_controller.dart';
import '../features/ui/common/controllers/new_product_list_controller.dart';
import '../features/ui/common/controllers/popular_product_list_controller.dart';
import '../features/ui/common/controllers/special_product_list_controller.dart';
import '../features/ui/data/auth/controller/sign_in_controller.dart';
import '../features/ui/data/auth/controller/veify_otp_controller.dart';
import '../features/ui/screens/brand/data/controller/brand_list_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(NetworkCaller());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(MainBottomNavBarController());
    Get.put(SignUpController());
    Get.put(SignInController());
    Get.put(VerifyOtpController());
    Get.put(CartListController());
    Get.put(BrandsListController());
    Get.put(PopularProductListController());
    Get.put(SpecialProductListController());
    Get.put(NewProductListController());
  }
}
