import 'package:crafty_bay/features/ui/screens/product/data/model/brand_model.dart';
import 'package:get/get.dart';

import '../../../../../../app/app_urls.dart';
import '../../../../../../core/network_caller/network_caller.dart';

class BrandReadController extends GetxController {
  bool _getBrandReadProgress = false;
  bool get inProgress => _getBrandReadProgress;
  String? _errorMessage;
  String get errorMessage => _errorMessage!;
  List<BrandModel> _brandReadList = [];
  List<BrandModel> get reviewItemList => _brandReadList;
  Future<bool> getBrandRead(String brandId) async {
    bool isSuccess = false;
    _getBrandReadProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.brandsRead(brandId),
    );
    if (response.isSuccess) {
      List<BrandModel> list = [];
      for (Map<String, dynamic> json
          in response.responseData!['data']['results']) {
        list.add(BrandModel.fromJson(json));
      }
      _brandReadList = list;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _getBrandReadProgress = false;
    update();
    return isSuccess;
  }
}
