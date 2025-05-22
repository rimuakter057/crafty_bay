

import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../models/review_model.dart';

class ReviewsListController extends GetxController {
  bool _getReviewsInProgress= false;
  bool get inProgress =>_getReviewsInProgress;
  String? _errorMessage;
  String get errorMessage => _errorMessage!;
  List<ReviewModel> _reviewItemList = [];
  List<ReviewModel> get reviewItemList => _reviewItemList;
  Future <bool> getReviewList(String productId)async{
    bool isSuccess=false;
    _getReviewsInProgress=true;
    update();
    final NetworkResponse response =await Get.find<NetworkCaller>().getRequest(
        url:AppUrls.reviewList(productId) );
    if (response.isSuccess) {
      List<ReviewModel> list = [];
      for (Map<String, dynamic> json in response.responseData!['data']
      ['results']) {
        list.add(ReviewModel.fromJson(json));
      }
      _reviewItemList = list;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getReviewsInProgress = false;
    update();
    return isSuccess;
  }
}





