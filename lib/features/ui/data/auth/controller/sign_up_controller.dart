import 'package:crafty_bay/features/ui/data/auth/models/sign_up_model.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
   bool _inProgress = false;
  bool get inProgress => _inProgress;
  Future <bool> SignUp(SignUpModel signUpModel)async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    return  isSuccess;
  }
}