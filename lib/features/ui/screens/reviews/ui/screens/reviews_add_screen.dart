import 'package:crafty_bay/features/ui/screens/reviews/ui/data/controller/add_review_controller.dart';
import 'package:crafty_bay/features/ui/screens/reviews/ui/screens/reviews_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewsAddScreen extends StatefulWidget {
  const ReviewsAddScreen({super.key, });

  static const String name = '/reviews';

  @override
  State<ReviewsAddScreen> createState() => _ReviewsAddScreenState();
}

class _ReviewsAddScreenState extends State<ReviewsAddScreen> {
  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _detailsController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Reviews Add"),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children:[
              SizedBox(height: 100,),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
                controller: _nameController,
              ),
              SizedBox(height: 20,),
              TextField(
                maxLines: 8,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'details',
                ),
          controller: _detailsController,
              ),
              SizedBox(height: 10,),
              ElevatedButton(onPressed: (){
                Get.toNamed(ReviewsListScreen.name);
              }, child: Text("button"))
            ]
              ),
        ),
      ),
    );
  }
}
