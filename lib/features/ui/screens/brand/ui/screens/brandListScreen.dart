import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/controller/brand_list_controller.dart';



class BrandsListScreen extends StatefulWidget {
  const BrandsListScreen({super.key, });

  static const String name = '/brand-list';
  @override
  State<BrandsListScreen> createState() => _BrandsListScreenState();
}

class _BrandsListScreenState extends State<BrandsListScreen> {
  final BrandsListController _brandsListController = Get.find<BrandsListController>();
  @override
  void initState() {
    super.initState();
    _brandsListController.getBrandList();
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
