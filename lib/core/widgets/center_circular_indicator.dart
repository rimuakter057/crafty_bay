import 'package:flutter/material.dart';

import '../../app/utils/constants/color.dart';

class CenterCircularIndicator extends StatelessWidget {
  const CenterCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: AppColors.themeColor),
    );
  }
}
