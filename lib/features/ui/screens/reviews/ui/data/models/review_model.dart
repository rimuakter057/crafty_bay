// import '../../../../product/data/model/product_model.dart';
//
// class ReviewModel {
//   final String id;
//   final ProductModel productModel;
//
//
//   ReviewModel(
//       {required this.productModel,
//         required this.id,
//        });
//
//   factory ReviewModel.fromJson(Map<String, dynamic> jsonData) {
//     return ReviewModel(
//       id: jsonData['_id'],
//       productModel: ProductModel.fromJson(jsonData['product']),
//     );
//   }
// }

class ReviewModel {
  final String id;
  final String userName;
  final String comment;

  ReviewModel({
    required this.id,
    required this.userName,
    required this.comment,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'],
      userName: "${json['user']['first_name']} ${json['user']['last_name']}",
      comment: json['comment']??'',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'comment': comment,
    };
  }
}