import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/add_review_controller.dart';


class ReviewsListScreen extends StatefulWidget {
  const ReviewsListScreen({super.key, required this.productId});
  final String productId;
  static const String name = '/reviews-list';
  @override
  State<ReviewsListScreen> createState() => _ReviewsListScreenState();
}

class _ReviewsListScreenState extends State<ReviewsListScreen> {
  final ReviewsListController _reviewsListController = Get.find<ReviewsListController>();
  @override
  void initState() {
    super.initState();
    _reviewsListController.getReviewList(widget.productId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Reviews")),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context,index){
         return ListTile(
           subtitle: Text("leading"),
           title: Text("title"),
         );
      },
      ),
    );
  }
}
