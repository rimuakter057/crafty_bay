import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

import '../../../product/data/model/brand_model.dart';

class BrandsListController extends GetxController {
  bool _getBrandsInProgress = false;
  bool get inProgress => _getBrandsInProgress;
  String? _errorMessage;
  String get errorMessage => _errorMessage!;
  List<BrandModel> _brandItemList = [];
  List<BrandModel> get brandItemList => _brandItemList;
  Future<bool> getBrandList() async {
    bool isSuccess = false;
    _getBrandsInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.brandListUrl,
    );
    if (response.isSuccess) {
      List<BrandModel> list = [];
      for (Map<String, dynamic> json
          in response.responseData!['data']['results']) {
        list.add(BrandModel.fromJson(json));
      }
      _brandItemList = list;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getBrandsInProgress = false;
    update();
    return isSuccess;
  }
}
