
import 'package:crafty_bay/core/widgets/center_circular_indicator.dart';
import 'package:crafty_bay/features/ui/data/auth/controller/sign_up_controller.dart';
import 'package:crafty_bay/features/ui/data/auth/models/sign_up_model.dart';
import 'package:crafty_bay/features/ui/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../app/utils/constants/color.dart';
import '../../../../../app/utils/sizes.dart';
import '../../../../../core/widgets/show_snack_bar.dart';
import '../../../widget/app_logo.dart';
import '../verifyOtpScreen/verify_otp_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _phoneTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final TextEditingController _deliveryAddressTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final SignUpController signUpController = Get.find<SignUpController>();


  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.defaultPadding(context)),
          child: _buildForm(textTheme),
        ),
      ),
    );
  }

  Widget _buildForm(TextTheme textTheme) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
        children: [
          const SizedBox(height: 32),
          const AppLogo(),
          const SizedBox(height: 24),
          Text(
           "register your account",
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
        "get started with your details",
            style: const TextStyle(color: Colors.grey, fontSize: 16),
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: _emailTEController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: "email"),
              validator: (String? value) {
                String email = value ?? '';
                if (!EmailValidator.validate(email)) {
                  return 'Enter a valid email';
                }
                return null;
              }



          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _firstNameTEController,
            textInputAction: TextInputAction.next,
            decoration:
            InputDecoration(hintText: "first name"),
          ),
          const SizedBox(height: 8),
          TextFormField(
            validator: (String?value){
              if(value?.trim().isEmpty??true){
                return 'Enter your address';
              }
              return null;
            },
            controller: _lastNameTEController,
            textInputAction: TextInputAction.next,
            decoration:
            InputDecoration(hintText: "last name"),
          ),
          const SizedBox(height: 8),
          TextFormField(
              controller: _phoneTEController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(hintText: "phone"),
            validator: (String? value) {
              String phoneNumber = value ?? '';
              RegExp regExp = RegExp(r'^(?:\+88|88)?01[3-9]\d{8}$');
              if (regExp.hasMatch(phoneNumber) == false) {
                return 'Enter your valid phone number';
              }
              return null;
            },





          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            decoration: InputDecoration(hintText:"password"),
            validator: (String?value){
              if(value!.isEmpty){
                return 'Enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _deliveryAddressTEController,
            textInputAction: TextInputAction.next,
            maxLines: 3,
            validator: (String?value){
              if(value?.trim().isEmpty??true){
                return 'Enter your address';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "delivery address",
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),

            ),
          ),
          const SizedBox(height: 16),
          // sign up

          GetBuilder<SignUpController>(
            builder: (controller) {
              return Visibility(
                visible: controller.inProgress==false,
                replacement:CenterCircularIndicator(),
                child: ElevatedButton(
                  onPressed: _onTapSignUpButton,
                  child: Text("sign up"),
                ),
              );
            }
          ),

          const SizedBox(height: 24),
          RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.w600),
              children: [
                TextSpan(
                    text: 'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = _onTapSignInButton),
              ],
            ),
          )
        ],
      ),
    );
  }


  void _onTapSignInButton() {
   Get.toNamed(SignInScreen.name);
  }



  Future<void> _onTapSignUpButton() async {
    if (_formKey.currentState!.validate()){
      SignUpModel signUpModel = SignUpModel(
        firstName: _firstNameTEController.text.trim(),
        lastName: _lastNameTEController.text.trim(),
        email: _emailTEController.text.trim(),
        password: _passwordTEController.text,
        phone: _phoneTEController.text.trim(),
        deliveryAddress: _deliveryAddressTEController.text.trim(),
      );
  final bool isSuccess = await signUpController.signUp(signUpModel);
       if(isSuccess){
     Navigator.pushNamed(context, VerifyOtpScreen.name,arguments: _emailTEController.text.trim());
   }else{
     showSnackBar(context, 'Something went wrong');
   }
    }
  }










  @override
  void dispose() {
    _emailTEController.dispose();
    _firstNameTEController.dispose();
    _lastNameTEController.dispose();
    _phoneTEController.dispose();
    _passwordTEController.dispose();
    _deliveryAddressTEController.dispose();
    super.dispose();
  }
}
