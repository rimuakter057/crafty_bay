import 'package:crafty_bay/features/ui/common/controllers/category_controller.dart';
import 'package:crafty_bay/features/ui/common/controllers/home_slider_controller.dart';
import 'package:crafty_bay/features/ui/common/controllers/main_bottom_nav_controller.dart';
import 'package:crafty_bay/features/ui/screens/cart/ui/screens/cart_list_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../screens/auth/sign_in_screen/sign_in_screen.dart';
import '../../screens/category/category_list_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/wishlist/ui/screens/wish_list_screen.dart';
import '../controllers/new_product_list_controller.dart';
import '../controllers/popular_product_list_controller.dart';
import '../controllers/special_product_list_controller.dart';


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
    const CartListScreen(),
    const WishListScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getSlider();
      Get.find<CategoryController>().getCategoryList();
      Get.find<PopularProductListController>().getProduct();
      Get.find<NewProductListController>().getProduct();
      Get.find<SpecialProductListController>().getProduct();
    });
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
              onDestinationSelected: (int index) {
                if (controller.shouldNavigate(index)) {
                  controller.changeIndex(index);
                } else {
                  Get.to(() => const SignInScreen());
                }
              },
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