import '../../../../product/data/model/product_model.dart';

class ReviewModel {
  final String id;
  final ProductModel productModel;


  ReviewModel(
      {required this.productModel,
        required this.id,
       });

  factory ReviewModel.fromJson(Map<String, dynamic> jsonData) {
    return ReviewModel(
      id: jsonData['_id'],
      productModel: ProductModel.fromJson(jsonData['product']),
    );
  }
}