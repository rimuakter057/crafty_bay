import 'package:crafty_bay/app/utils/asset_path.dart';
import 'package:crafty_bay/core/widgets/show_snack_Bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../app/utils/constants/color.dart';
import '../../model/cart_model.dart';
import '../controller/product_cart_controller.dart';
import 'increment_decrement_counter_widget.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
    required this.cardModel,
    required this.quantity,
  });

  final CartModel cardModel;
  final Function(int count) quantity;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _deleteInProgress = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        height: 100,
        width: 90,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            '${widget.cardModel.photo}',
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: Image.asset(AssetPath.logoNavPng),
                ),
              );
            },
          ),
        ),
      ),
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.cardModel.title ?? 'Unknown product',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Text(
                      'Color: ${widget.cardModel.color}',
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Size: ${widget.cardModel.size}',
                      style: TextStyle(fontSize: 10),
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
                final bool isSuccess = await Get.find<CartListController>()
                    .removeFromCart(widget.cardModel);
                _deleteInProgress = false;
                setState(() {});
                if (isSuccess == false) {
                  showSnackBar(
                    context,
                    Get.find<CartListController>().removeFromCartErrorMessage!,
                    true,
                  );
                }
              },
              icon: const Icon(Icons.delete_outline, color: Colors.grey),
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
      subtitle: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '৳${widget.cardModel.currentPrice}',
            style: TextStyle(
              color: AppColors.themeColor,
              fontWeight: FontWeight.bold,
            ),
          ),

          IncrementDecrementCountWidget(
            count: widget.cardModel.quantity ?? 0,
            quantity: (count) {
              widget.quantity(count);
            },
          ),
        ],
      ),
    );
  }
}
