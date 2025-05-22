import 'package:crafty_bay/core/widgets/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../product/widgets/increment_decrement_counter.dart';
import '../../data/model/cart_item_model.dart';
import '../controller/cart_list_controller.dart';

class CartItemCard extends StatefulWidget {
  const CartItemCard({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  State<CartItemCard> createState() => _CartItemCardState();
}

class _CartItemCardState extends State<CartItemCard> {
   bool _deleteInProgress = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image.network(
              '',
              width: 100,
              height: 100,
              errorBuilder: (_, __, ___) {
                return const Icon(Icons.error_outline);
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("title",
                             // widget.cartItem.productModel.title,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                Text('Color:'' ${widget.cartItem.color}'
                                ),
                                Text('Size:'' ${widget.cartItem.size}'
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: _deleteInProgress == false,
                        replacement: const CircularProgressIndicator(),
                        child: IconButton(
                          onPressed: () async {
                            _deleteInProgress = true;
                            setState(() {});
                            final bool isSuccess =
                            await Get.find<CartListController>()
                                .removeFromCart(widget.cartItem.id);
                            _deleteInProgress = false;
                            setState(() {});
                            if (isSuccess == false) {
                              showSnackBar(
                                  context,
                                  Get.find<CartListController>()
                                      .removeFromCartErrorMessage!,
                                  true);
                            }
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          '\$${widget.cartItem.productModel.currentPrice}'
                      ),
                      SizedBox(
                        width: 80,
                        child: FittedBox(
                          child: IncrementDecrementCounterWidget(
                                                    onChange: (int count) {
                              Get.find<CartListController>()
                                  .updateProduct(widget.cartItem.id, count);
                            },
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}