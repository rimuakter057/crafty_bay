import 'package:crafty_bay/core/widgets/center_circular_indicator.dart';
import 'package:crafty_bay/features/ui/common/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/controllers/main_bottom_nav_controller.dart';
import '../../widget/category_item.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final CategoryController _categoryController = Get.find<CategoryController>();
   final  ScrollController _ScrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _categoryController.getCategoryList();
   _ScrollController.addListener(_loadMoreData);
  }
void _loadMoreData(){
    if(_ScrollController.position.extentAfter<300){
      _categoryController.getCategoryList();
    }
}


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          title: const Text('Categories'),
        ),
        body: GetBuilder<CategoryController>(
          builder: (controller) {
            if(controller.isInitialLoading){
              return CenterCircularIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: ()async{
                        controller.refreshList();
                      },
                      child: GridView.builder(
                        controller: _ScrollController,
                        itemCount: controller.categoryList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return  FittedBox(child: CategoryItem(
                            categoryModel:controller.categoryList[index] ,
                          ));
                        },
                      ),
                    ),
                  ),
                  Visibility(
                      visible: controller.isLoadMoreInProgress,
                      child: LinearProgressIndicator())
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
