import 'package:crafty_bay/core/widgets/show_snack_bar.dart';
import 'package:crafty_bay/features/ui/data/auth/controller/sign_in_controller.dart';
import 'package:crafty_bay/features/ui/data/auth/models/sign_in_request_model.dart';
import 'package:crafty_bay/features/ui/widget/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../../../../app/utils/constants/color.dart';
import '../../../../../app/utils/sizes.dart';
import '../../../common/screens/main_bottom_nav_screen.dart';
import '../sign_up_screen/sign_up_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
 final SignInController _signInController = Get.find<SignInController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Logger().i("User signed in successfully");

  }



  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.defaultPadding(context)),
          child: Column(
            children: [
              const SizedBox(height: 60),
              const AppLogo(),
              const SizedBox(height: 24),
              Text(
               "welcome back",
                style: textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(
               "enter email or password",
                style: const TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailTEController,
                decoration:
                InputDecoration(hintText:"email"),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordTEController,
                obscureText: true,
                decoration:
                InputDecoration(hintText: "password"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _onTapSignInButton();
                                 },
                child: Text("sign in"),
              ),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = _onTapSignUpButton
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  void _onTapSignInButton()async {
  SignInRequestModel signInRequestModel =SignInRequestModel(
      email: _emailTEController.text.trim(),
      password: _passwordTEController.text);
  final bool isSuccess= await _signInController.signIn(signInRequestModel);
  if(isSuccess){
    Get.offAllNamed(MainBottomNavBarScreen.name);
  }else{
    showSnackBar(context, _signInController.errorMessage!, true);
  }


  }



  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }

  @override
  void dispose(){
    super.dispose();
    _emailTEController.dispose();
    _passwordTEController.dispose();
  }

}
