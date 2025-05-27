import 'package:crafty_bay/core/widgets/show_snack_Bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/controller/add_review_controller.dart';

class ReviewsAddScreen extends StatefulWidget {
  const ReviewsAddScreen({super.key, required this.productId});
  final String productId;
  static String name = '/ProductAddReview';

  @override
  State<ReviewsAddScreen> createState() => _ReviewsAddScreenState();
}

class _ReviewsAddScreenState extends State<ReviewsAddScreen> {
  final AddReviewController _addReviewController = AddReviewController();
  final TextEditingController _reviewController = TextEditingController();
  int ratingCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text('Add Review', style: TextStyle(fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 30),
              // RatingBar.builder(
              //   initialRating: 3,
              //   minRating: 1,
              //   direction: Axis.horizontal,
              //   allowHalfRating: false,
              //   itemCount: 5,
              //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              //   itemBuilder:
              //       (context, _) => Icon(Icons.star, color: Colors.amber),
              //   onRatingUpdate: (rating) {
              //     ratingCount = rating.toInt();
              //   },
              // ),
              SizedBox(height: 30),
              TextField(
                controller: _reviewController,
                maxLines: 7,
                decoration: InputDecoration(
                  hintText: 'Write Review',
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
              ),
              SizedBox(height: 16),
              GetBuilder(
                init: _addReviewController,
                builder: (controller) {
                  return controller.inProgress == true
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_reviewController.text.trim().isNotEmpty) {
                              addReview();
                            } else {
                              showSnackBar(
                                context,
                                'Place write somthing',
                                true,
                              );
                            }
                          },
                          child: Text('Submit'),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addReview() async {
    bool isSuccess = await _addReviewController.apiCall({
      "product": widget.productId,
      "comment": _reviewController.text.trim(),
      "rating": ratingCount,
    });
    if (isSuccess) {
      showSnackBar(context, 'Add review successfully');
    } else {
      showSnackBar(context, _addReviewController.errorMessage, true);
    }
  }
}
