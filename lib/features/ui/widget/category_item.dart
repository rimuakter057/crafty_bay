import 'package:crafty_bay/features/ui/common/model/category_model.dart';
import 'package:flutter/material.dart';

import '../../../app/utils/constants/color.dart';
import '../screens/product/screens/product_list_screen.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key, required this.categoryModel,
  });

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductListScreen.name,
            arguments: categoryModel);
      },
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            color: AppColors.themeColor.withOpacity(0.15),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                categoryModel.icon,
                width: 48,
                height: 48,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.image_not_supported_outlined);
                },
              ),
            ),
          ),
          Text(
            categoryModel.title,
            style: const TextStyle(
                color: AppColors.themeColor,
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}