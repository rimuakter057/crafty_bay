import 'package:crafty_bay/app/utils/sizes.dart';
import 'package:crafty_bay/features/ui/data/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/screens/main_bottom_nav_screen.dart';
import '../../../widget/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    Get.find<AuthController>().getUserData();
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacementNamed(context, MainBottomNavBarScreen.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(AppSizes.defaultPadding(context)),
        child: Center(
          child: Column(
            children: [
              Spacer(),
              AppLogo(),
              Spacer(),
              const CircularProgressIndicator(),
              SizedBox(height: AppSizes.spaceBthItems(context)),
              Text("version 1.0.0"),
            ],
          ),
        ),
      ),
    );
  }
}
