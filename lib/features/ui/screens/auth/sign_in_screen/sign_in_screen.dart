import 'package:crafty_bay/features/ui/widget/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../../../../app/utils/constants/color.dart';
import '../../../../../app/utils/sizes.dart';
import '../sign_up_screen/sign_up_screen.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  static const String name = '/sign-in';
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

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
                decoration:
                InputDecoration(hintText:"email"),
              ),
              const SizedBox(height: 8),
              TextFormField(
                obscureText: true,
                decoration:
                InputDecoration(hintText: "password"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
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

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, SignUpScreen.name);
  }
}
