import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';

import 'package:get/get.dart';

import '../../model/wish_list_model.dart';

class WishListController extends GetxController {
  final int _perPageDataCount = 30;
  bool _inProgress = false;
  bool _paginationInProgress = false;
  int _currentPage = 0;
  int? _totalPage;
  String? _errorMassage;
  List<WishListItemModel> _productList = [];

  bool get inProgress => _inProgress;

  bool get paginationInProgress => _paginationInProgress;

  String? get errorMassage => _errorMassage;

  int get currentPage => _currentPage;

  List<WishListItemModel> get producvtList => _productList;

  Future<bool> getProduct() async {
    if (_paginationInProgress) {
      return false;
    }

    bool isSuccess = false;

    _currentPage++;
    if (_totalPage != null && _currentPage > _totalPage!) {
      return false;
    }

    if (_currentPage == 1) {
      _inProgress = true;
    } else {
      _paginationInProgress = true;
    }
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.wishlist,
      queryParams: {
        'count': _perPageDataCount,
        'page': _currentPage,
      },
    );
    if (response.isSuccess) {
      _productList.addAll(
        (response.responseData!['data']['results'] as List)
            .map((e) => WishListItemModel.fromJson(e))
            .toList(),
      );
      _totalPage = response.responseData!['data']['last_page'] ?? _totalPage;
      print(_totalPage);
      isSuccess = true;
      _errorMassage = '';
    } else {
      isSuccess = false;
      _errorMassage = response.errorMessage;
    }

    _inProgress = false;
    _paginationInProgress = false;
    update();
    return isSuccess;
  }

  void refrash() {
    _productList = [];
    _currentPage = 0;
    getProduct();
  }
}
