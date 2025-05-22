import 'package:crafty_bay/features/ui/common/controllers/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/wish_list_controller.dart';
import '../widget/wish_list_widget.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});


  @override
  State<WishListScreen> createState() =>
      _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final ScrollController _scrollController = ScrollController();

  final WishListController _wishListController = WishListController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(pagination);
    _wishListController.getProduct();
  }

  void pagination() {
    if (_scrollController.position.extentAfter < 300) {
      _wishListController.getProduct();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        Get.find<MainBottomNavBarController>().backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavBarController>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          title: Text('Popular', style: TextStyle(fontSize: 24)),
          forceMaterialTransparency: true,
        ),
        body: GetBuilder(
          init: _wishListController,
          builder: (controller) {
            return controller.inProgress
                ? Center(child: CircularProgressIndicator())
                : RefreshIndicator(
              onRefresh: () async {
                _wishListController.refrash();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 200,
                        mainAxisSpacing: 20,
                      ),
                      delegate: SliverChildBuilderDelegate(
                          childCount: controller.producvtList.length,
                              (context, index) {
                            return FittedBox(
                              child: WishListWidget(
                                products: controller.producvtList[index].product,
                              ),
                            );
                          }),
                    ),
                    if(controller.paginationInProgress)
                      SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
