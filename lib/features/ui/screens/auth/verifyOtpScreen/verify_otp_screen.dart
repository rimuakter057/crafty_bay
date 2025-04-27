import 'dart:async';

import 'package:crafty_bay/core/widgets/show_snack_bar.dart';
import 'package:crafty_bay/features/ui/data/auth/controller/veify_otp_controller.dart';
import 'package:crafty_bay/features/ui/data/auth/models/verify_otp_model.dart';
import 'package:crafty_bay/features/ui/screens/auth/sign_in_screen/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../../app/utils/sizes.dart';
import '../../../widget/app_logo.dart';
import '../sign_up_screen/sign_up_screen.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key, required this.email});

  final String email;
  static const String name = '/verify-otp-screen';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final VerifyOtpController _verifyOtpController =
      Get.find<VerifyOtpController>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RxInt _currentTime = 30.obs;

void _startTimer() {
  _currentTime.value=30;
  Timer.periodic(Duration(seconds: 30), (timer){
    if(_currentTime.value==0){
      timer.cancel();
    }else{
      _currentTime.value=_currentTime.value-1;
    }
  });
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.defaultPadding(context)),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 60),
                const AppLogo(),
                const SizedBox(height: 24),
                Text("enter your otp", style: textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(
                  "four digit code has been sent to your email",
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(height: 16),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 50,
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  backgroundColor: Colors.transparent,
                  enableActiveFill: true,
                  controller: _otpTEController,
                  appContext: context,
                  validator: (String? value) {
                    if ((value?.length ?? 00) < 4) {
                      return 'enter 4 digit code';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    _onTapVerifyButton();
                  },
                  child: Text("verify"),
                ),
                Obx(
                  () {
                    return Column(
                      children: [
                        Visibility(
                          visible: _currentTime.value==0,
                          child: TextButton(
                            onPressed: () {
                              /// controller
                              _startTimer();
                            },
                            child: Text("Resend Otp"),
                          ),
                        ),
                        Visibility(
                          visible: _currentTime.value!=0,
                          child: TextButton(
                            onPressed: () {

                            },
                            child: Text("Resend in ${_currentTime.value}s"),
                          ),
                        ),
                      ],
                    );
                  }
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onTapVerifyButton() async {
    if (_formKey.currentState!.validate()) {
      _verifyOtp();
    }
  }

  Future<void> _verifyOtp() async {
    VerifyOtpModel verifyOtpModel = VerifyOtpModel(
      email: widget.email.trim(),
      otp: _otpTEController.text,
    );
    final bool isSuccess = await _verifyOtpController.verifyOtp(verifyOtpModel);
    if (isSuccess) {
      showSnackBar(context, "otp has been verified ! please sign in");
      Get.offAllNamed(SignInScreen.name);
    } else {
      showSnackBar(context, _verifyOtpController.errorMessage!, true);
    }
  }
}
