import 'package:flutter/material.dart';

import '../../../widget/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.category});

  final String category;

  static const String name = '/products';

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: GridView.builder(
        itemCount: 30,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 0
        ),
        itemBuilder: (context, index) {
          return const FittedBox(child: ProductCard());
        },
      ),
    );
  }
}
