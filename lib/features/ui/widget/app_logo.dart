import 'package:flutter/material.dart';

import '../../../app/utils/asset_path.dart';
import '../../../app/utils/sizes.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset( AssetPath.appLogoPng,width: AppSizes.logoW(context),);
  }
}