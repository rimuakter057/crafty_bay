import 'package:crafty_bay/features/ui/data/auth/controller/sign_up_controller.dart';
import 'package:get/get.dart';

import '../core/network_caller/network_caller.dart';
import '../features/ui/common/controllers/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkCaller());
    Get.put(MainBottomNavBarController());
    Get.put(SignUpController());

  }
}