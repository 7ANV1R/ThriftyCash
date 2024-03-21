import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../const/asset_const.dart';

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RepaintBoundary(
        child: Image.asset(AssetConstants.downloadImage)
            .animate(
              onPlay: (controller) => controller.repeat(reverse: true),
            )
            .slideY(begin: 0.1, end: 0.15, duration: 600.ms, curve: Curves.easeIn)
            .shimmer(),
      ),
    );
  }
}
