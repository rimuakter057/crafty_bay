
import 'package:flutter/material.dart';

import '../../data/models/review_model.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.review,
  });

  final ReviewModel review;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 16,
              child: Icon(Icons.person),
            ),
            SizedBox(width: 10),
            Text(review.userName),
          ],
        ),
        SizedBox(height: 8),
        Text(review.comment),
        SizedBox(height: 8),
      ],
    );
  }
}
