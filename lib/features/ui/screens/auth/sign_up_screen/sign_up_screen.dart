
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../app/utils/constants/color.dart';
import '../../../../../app/utils/sizes.dart';
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
  final TextEditingController _deliveryAddressTEController =
  TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _passwordTEController,
            decoration:
            InputDecoration(hintText:"password"),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: _deliveryAddressTEController,
            textInputAction: TextInputAction.next,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "delivery address",
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _onTapSignUpButton,
            child: Text("sign up"),
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

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }

  void _onTapSignInButton() {
    Navigator.pop(context);
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
