import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/ui/cart/model/cart_model.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  bool _removeFromCartListInProgress = false;

  bool get removeFromCartListInProgress => _removeFromCartListInProgress;

  String? _errorMassage;

  String? get errorMassage => _errorMassage;

  String? _removeFromCartErrorMessage;

  String? get removeFromCartErrorMessage => _removeFromCartErrorMessage;

  List<CartModel> _cardList = [];

  List<CartModel> get cardList => _cardList;

  Future<bool> getCards() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    _cardList.clear();

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(
      url: AppUrls.cartListUrl,
    );
    if (response.isSuccess) {
      _cardList.addAll(
        (response.responseData!['data']['results'] as List)
            .map((e) => CartModel.fromJson(e))
            .toList(),
      );
      isSuccess = true;
      _errorMassage = '';
    } else {
      isSuccess = false;
      _errorMassage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }

  double get totalPrice {
    double total = 0;
    for (CartModel cartItem in _cardList) {
      total += (cartItem.currentPrice! * cartItem.quantity!);
    }
    return total;
  }

  Future<void> updateProduct(CartModel cartModel, int quantity) async {
    for (CartModel cartItem in _cardList) {
      if (cartItem.id == cartModel.id) {
        cartItem.quantity = quantity;
        break;
      }
    }
    update();
    await NetworkCaller().patchRequest(
      url: AppUrls.cardById(cartModel.id ?? ''),
      body: {'quantity': quantity},
    );
  }

  Future<bool> removeFromCart(CartModel cartModel) async {
    bool isSuccess = false;
    _removeFromCartListInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>()
        .deleteRequest(url: AppUrls.cardById(cartModel.cid ?? ''));
    if (response.isSuccess) {
      _cardList.removeWhere((e) => e.id == cartModel.id);
      isSuccess = true;
    } else {
      _removeFromCartErrorMessage = response.errorMessage;
    }
    _removeFromCartListInProgress = false;
    update();
    return isSuccess;
  }
}
