import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/utils/constants/color.dart';
import '../../../common/controllers/main_bottom_nav_controller.dart';
import '../../../data/auth/controller/auth_controller.dart';
import '../controller/product_cart_controller.dart';
import '../controller/ssl_getway.dart';
import '../widget/card_widget.dart';

class CartListScreen extends StatefulWidget {
  const CartListScreen({super.key});
  static const String name = '/cart-screen';
  @override
  State<CartListScreen> createState() => _CartListScreenState();
}

class _CartListScreenState extends State<CartListScreen> {
  final CartListController _cardController = Get.find<CartListController>();
  final AuthController _authController = Get.find<AuthController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cardController.getCards();
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
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          title: Text('Cart', style: TextStyle(fontSize: 24)),
          forceMaterialTransparency: true,
        ),
        body: GetBuilder(
          init: _cardController,
          builder: (controller) {
            return controller.inProgress == true
                ? Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemCount: controller.cardList.length,
                        padding: EdgeInsets.only(bottom: 40),
                        itemBuilder: (context, index) {
                          return CardWidget(
                            cardModel: controller.cardList[index],
                            quantity: (count) {
                              controller.updateProduct(
                                controller.cardList[index],
                                count,
                              );
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider(color: Colors.grey.shade100);
                        },
                      ),
                    ),
                    _buildPriceAndCheckOut(controller.totalPrice),
                  ],
                );
          },
        ),
      ),
    );
  }

  Widget _buildPriceAndCheckOut(double totalPrice) {
    return Container(
      height: 70,
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.teal.shade50,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16),
          topLeft: Radius.circular(16),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Total Price',
                  style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.textPrimary),
                ),
                Text(
                  '$totalPrice',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.themeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              sslProcess(
                context: context,
                storeId: 'ntech681f8c458e695',
                storePassword: 'ntech681f8c458e695@ssl',
                amount: totalPrice,
                customerName: _authController.user!.firstName,
                customerEmail: _authController.user!.email,
                customerPhone: _authController.user!.phone,
                customerAddress: _authController.user!.city,
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: AppColors.themeColor,
              fixedSize: Size(120, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Center(
              child: Text('Checkout',
                style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.white,fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
