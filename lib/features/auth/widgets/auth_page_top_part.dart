import 'package:flutter/material.dart';
import 'package:thrifycash/common/ui/ui_utils.dart';

import '../../../common/ui/color_helper.dart';
import '../../../const/asset_const.dart';

class AuthPageTopPart extends StatelessWidget {
  const AuthPageTopPart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: generateLighterColor(context.scheme.primary, 0.15),
        ),
        child: Center(
          child: Image.asset(
            AssetConstants.logoPNG,
            width: context.screenSize.width * 0.5,
          ),
        ),
      ),
    );
  }
}
