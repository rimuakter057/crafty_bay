
import 'package:crafty_bay/features/ui/screens/product/data/model/product_model.dart';
import 'package:flutter/material.dart';

import '../../../app/utils/asset_path.dart';
import '../../../app/utils/constants/color.dart';
import '../screens/product/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productModel,
  });
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name,
        arguments: productModel.id
        );
      },
      child: Card(
        color: Colors.white,
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Container(
                height: 120,
                width: 140,
                decoration: BoxDecoration(
                  color: AppColors.themeColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image:productModel.photos.isNotEmpty? DecorationImage(
                      image: NetworkImage(productModel.photos.first),
                      fit: BoxFit.cover):null,
                ),
                child: productModel.photos.isEmpty?Icon(Icons.error):null,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                     Text(
                    productModel.title,
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          '${productModel.currentPrice}',
                          style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.w600),
                        ),
                        const Wrap(
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.orange,
                            ),
                            Text('3.3')
                          ],
                        ),
                        Card(
                          color: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2)),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Icon(
                              Icons.favorite_border,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
