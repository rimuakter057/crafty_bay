import 'package:crafty_bay/features/ui/screens/product/data/model/product_model.dart';
import 'package:get/get.dart';

import '../../../../../../app/app_urls.dart';
import '../../../../../../core/network_caller/network_caller.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  late ProductModel _productModel;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool get inProgress => _inProgress;
  ProductModel get productModel => _productModel;

  Future<bool> getProductDetails(String productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.productDetails(productId),
    );
    if (response.isSuccess) {
      _productModel = ProductModel.fromJson(response.responseData!['data']);
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
