import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';

import 'package:get/get.dart';

import '../model/product_model.dart';

class ProductListController extends GetxController {
  final int _perPageDataCount = 15;
  int _currentPage = 0;
  int? _totalPage;
  bool _isInitialLoading = true;
  bool _isMoreLoading = false;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  bool get isMoreLoading => _isMoreLoading;
  bool get isInitialLoading => _isInitialLoading;
  int? get totalPage => _totalPage;
  int? get currentPage => _currentPage;
  int? get perPageDataCount => _perPageDataCount;
  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;

  Future<bool> getProductByList(String categoryId) async {
    if (_totalPage != null && _currentPage > _totalPage!) {
      return true;
    }
    bool isSuccess = false;
    _currentPage++;
    if (!_isInitialLoading) {
      _isMoreLoading = true;
    }
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.productList,
      queryParams: {
        'count': _perPageDataCount,
        'page': _currentPage,
        'category': categoryId,
      },
    );
    if (response.isSuccess) {
      List<ProductModel> list = [];
      for (Map<String, dynamic> data
          in response.responseData!['data']['results']) {
        list.add(ProductModel.fromJson(data));
      }
      _productList.addAll(list);
      _totalPage = response.responseData!['data']["last_page"];
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }

    if (!_isInitialLoading) {
      _isMoreLoading = false;
    } else {
      _isInitialLoading = false;
    }
    update();
    return isSuccess;
  }

  Future<bool> refreshLis(String categoryId) {
    _currentPage = 0;
    _productList = [];
    _isInitialLoading = true;
    return getProductByList(categoryId);
  }
}
