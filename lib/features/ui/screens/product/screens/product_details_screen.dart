import 'package:crafty_bay/core/widgets/center_circular_indicator.dart';
import 'package:crafty_bay/core/widgets/show_snack_bar.dart';
import 'package:crafty_bay/features/ui/common/controllers/add_to_cart_controller.dart';
import 'package:crafty_bay/features/ui/screens/product/data/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/utils/constants/color.dart';
import '../../../data/auth/controller/auth_controller.dart';
import '../../auth/sign_in_screen/sign_in_screen.dart';
import '../widgets/color_picker.dart';
import '../widgets/increment_decrement_counter.dart';
import '../widgets/product_image_carousel.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});
  static const String name = '/product-details';
  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ProductDetailsController _productDetailsController =
      ProductDetailsController();
  final AddToCartController _addToCartController = AddToCartController();
  String? _selectedColor;
  String? _selectedSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _productDetailsController.getProductDetails(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("product details")),
      body: GetBuilder(
        init: _productDetailsController,
        builder: (controller) {
          if (controller.inProgress) {
            return CenterCircularIndicator();
          }

          if (controller.errorMessage != null) {
            return Center(child: Text(controller.errorMessage!));
          }

          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImageCarouselSlider(
                        imageList: controller.productModel.photos,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.productModel.title,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 20,
                                              ),
                                              Text(
                                                controller.productModel.rating
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text('Reviews'),
                                          ),
                                          Card(
                                            color: AppColors.themeColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                            ),
                                            child: const Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Icon(
                                                Icons.favorite_border,
                                                size: 16,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                IncrementDecrementCounterWidget(
                                  onChange: (int value) {
                                    print(value);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // if (controller.productModel.colors.isNotEmpty)
                            //   Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       const SizedBox(height: 16),
                            //       ColorPicker(
                            //         colors: controller.productModel.colors,
                            //         onChange: (selectedColor) {
                            //           _selectedColor = selectedColor;
                            //         },
                            //       ),
                            //     ],
                            //   ),


                            ColorPicker(
                              colors: controller.productModel.colors,
                              // colors: const ['Red', 'White', 'Black', 'Pink'],
                              onChange: (selectedColor) {
                                _selectedColor = selectedColor;
                              },
                            ),
                            const SizedBox(height: 16),
                            // Visibility(
                            //   visible: controller.productModel.sizes.isNotEmpty,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       const SizedBox(height: 16),
                            //       SizePicker(
                            //         sizes: controller.productModel.sizes,
                            //         onChange: (selectedSize) {
                            //           _selectedSize = selectedSize;
                            //         },
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizePicker(
                              sizes: controller.productModel.sizes,
                              // sizes: const ['S', 'M', 'L', 'XL'],
                              onChange: (selectedSize) {
                                _selectedSize = selectedSize;
                              },
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              controller.productModel.description,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _buildPriceAndAddToCartSection(
                controller.productModel.sizes.isNotEmpty,
                controller.productModel.colors.isNotEmpty,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection(
    bool isSizeAvailable,
    bool isColorAvailable,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.themeColor.withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Price'),
              Text(
                '\$1000',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 140,
            child: GetBuilder(
              init: _addToCartController,
              builder: (controller) {
                return Visibility(
                  visible: controller.inProgress == false,
                  replacement: CenterCircularIndicator(),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (isSizeAvailable && _selectedSize == null) {
                        showSnackBar(context, 'please select size');
                        return;
                      }
                      if (isColorAvailable && _selectedColor == null) {
                        showSnackBar(context, 'please select color');
                        return;
                      }

                      if (Get.find<AuthController>().isValidUser() == false) {
                        Get.to(() => const SignInScreen());
                        return;
                      }

                      final bool isSuccess = await _addToCartController
                          .addToCart(_productDetailsController.productModel.id);

                      if (isSuccess) {
                        showSnackBar(context, "add to cart");
                      } else {
                        showSnackBar(
                          context,
                          _addToCartController.errorMessage!,
                          true,
                        );
                      }
                    },
                    child: const Text('Add to Cart'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
