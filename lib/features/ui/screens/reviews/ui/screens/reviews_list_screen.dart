import 'package:flutter/material.dart';


class ReviewsListScreen extends StatefulWidget {
  const ReviewsListScreen({super.key});
  static const String name = '/reviews-list';
  @override
  State<ReviewsListScreen> createState() => _ReviewsListScreenState();
}

class _ReviewsListScreenState extends State<ReviewsListScreen> {
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
