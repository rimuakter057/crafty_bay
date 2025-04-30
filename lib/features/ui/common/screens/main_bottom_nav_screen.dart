import 'package:crafty_bay/features/ui/common/controllers/category_controller.dart';
import 'package:crafty_bay/features/ui/common/controllers/home_slider_controller.dart';
import 'package:crafty_bay/features/ui/common/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../screens/category/category_list_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/wish_list/wish_list_screen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  static const String name = '/main-nav-bar-screen';

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const HomeScreen(),
    const WishListScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<HomeSliderController>().getSlider();
    Get.find<CategoryController>().getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MainBottomNavBarController>(
          builder: (controller) {
            return _screens[controller.selectedIndex];
          }
      ),
      bottomNavigationBar: GetBuilder<MainBottomNavBarController>(
          builder: (controller) {
            return NavigationBar(
              selectedIndex: controller.selectedIndex,
              onDestinationSelected: controller.changeIndex,
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(icon: Icon(Icons.category), label: 'Category'),
                NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
                NavigationDestination(
                    icon: Icon(Icons.favorite_border), label: 'Wishlist'),
              ],
            );
          }
      ),
    );
  }
}