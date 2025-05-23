
import 'package:crafty_bay/core/widgets/center_circular_indicator.dart';
import 'package:crafty_bay/features/ui/common/controllers/category_controller.dart';
import 'package:crafty_bay/features/ui/common/model/category_model.dart';
import 'package:crafty_bay/features/ui/screens/home/widget/appbar_action_button.dart';
import 'package:crafty_bay/features/ui/screens/home/widget/home_carousel_slide.dart';
import 'package:crafty_bay/features/ui/screens/home/widget/section_header.dart';
import 'package:crafty_bay/features/ui/screens/product/screens/popular_product_list_screen.dart';
import 'package:crafty_bay/features/ui/screens/product/screens/special_product_list_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../app/utils/asset_path.dart';
import '../../common/controllers/main_bottom_nav_controller.dart';
import '../../widget/category_item.dart';
import '../../widget/product_card.dart';
import '../product/screens/new_product_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildSearchTextField(),
              const SizedBox(height: 16),

              const HomeCarouselSlider(),


              const SizedBox(height: 16),
              SectionHeader(
                title: "Categories",
                onTapSeeAll: () {
                  Get.find<MainBottomNavBarController>().moveToCategory();
                },
              ),
              const SizedBox(height: 16),
              _buildCategoriesSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: "popular",
                onTapSeeAll: () {
                  Get.toNamed(PopularProductListScreen.name);
                },
              ),
              const SizedBox(height: 16),
              _buildProductSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title:"special offer",
                onTapSeeAll: () {
                  Get.toNamed(SpecialProductListScreen.name);
                },
              ),
              const SizedBox(height: 16),
              _buildProductSection(),
              const SizedBox(height: 16),
              SectionHeader(
                title: "new",
                onTapSeeAll: () {
                  Get.toNamed(NewProductListScreen.name);
                },
              ),
              const SizedBox(height: 16),
              _buildProductSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          // ProductCard(),
          // ProductCard(),
          // ProductCard(),
          // ProductCard(),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return  GetBuilder<CategoryController>(
      builder: (controller) {
        if(controller.isInitialLoading){
          return SizedBox(
              height: 100,
              child: CenterCircularIndicator());
        }

        List <CategoryModel> list = controller.categoryList.length>10?
            controller.categoryList.sublist(0,10):controller.categoryList;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children:list.map((e){
              return CategoryItem(categoryModel: e);
            }).toList(),
          ),
        );
      }
    );
  }

  Widget _buildSearchTextField() {
    return TextField(
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Image.asset(AssetPath.appLogoPng),
      actions: [
        AppBarActionButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarActionButton(
          icon: Icons.call,
          onTap: () {},
        ),
        const SizedBox(width: 8),
        AppBarActionButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
      ],
    );
  }
}
