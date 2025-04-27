import 'package:crafty_bay/core/network_caller/network_caller.dart';
import 'package:crafty_bay/features/ui/data/auth/models/sign_up_model.dart';
import 'package:crafty_bay/features/ui/data/auth/models/verify_otp_model.dart';
import 'package:get/get.dart';
import '../../../../../app/app_urls.dart';

class VerifyOtpController extends GetxController{
  bool _verifyInProgress = false;
  bool get inProgress => _verifyInProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;
  Future <bool> verifyOtp(VerifyOtpModel verifyOtpModel)async{
    bool isSuccess = false;
    _verifyInProgress = true;
    update();
    final NetworkResponse response =
    await Get.find<NetworkCaller>().
    postRequest(url: AppUrls.verifyOtp,
      body: verifyOtpModel.toJson(),
    );
    if(response.isSuccess){
      _errorMessage =null;
      isSuccess = true;
    }else{
      _errorMessage = response.errorMessage;
    }
    _verifyInProgress = false;
    update();
    return  isSuccess;
  }
}