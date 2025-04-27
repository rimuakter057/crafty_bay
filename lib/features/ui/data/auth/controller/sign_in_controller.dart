

import 'package:crafty_bay/app/app_urls.dart';
import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/ui/data/auth/controller/auth_controller.dart';
import 'package:crafty_bay/features/ui/data/auth/models/sign_in_request_model.dart';
import 'package:crafty_bay/features/ui/data/auth/models/user_model.dart';
import 'package:get/get.dart';

class SignInController extends GetxController{
  bool _signInProgress= false;
  bool get inProgress =>_signInProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future <bool> signIn(SignInRequestModel signInRequestModel) async{
    bool isSuccess =false;
    _signInProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
        url: AppUrls.signIn,
        body: signInRequestModel.toJson(),
    );
    if(response.isSuccess){
      _errorMessage=null;
      isSuccess = true;
      //save user data
      UserModel userModel =UserModel.fromJson (response.responseData!['data']['user']);
      //save user model
      String accessToken =response.responseData!['data']['token'];
      await Get.find<AuthController>().saveUserData(accessToken, userModel);
      _errorMessage =null;
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _signInProgress= false;
    update();
   return  isSuccess;

  }

}