import 'package:flutter/material.dart';

class ReviewsListScreen extends StatefulWidget {
  const ReviewsListScreen({super.key});

  static const String name = '/reviews-list';

  @override
  State<ReviewsListScreen> createState() => _ReviewsListScreenState();
}

class _ReviewsListScreenState extends State<ReviewsListScreen> {
  final TextEditingController _nameController= TextEditingController();
  final TextEditingController _detailsController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Reviews"),
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
              ElevatedButton(onPressed: (){}, child: Text("button"))
            ]
              ),
        ),
      ),
    );
  }
}
