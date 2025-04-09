import 'package:get/get.dart';

import '../features/ui/common/controllers/main_bottom_nav_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(MainBottomNavBarController());
  }
}