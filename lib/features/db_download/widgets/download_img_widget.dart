import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../const/asset_const.dart';

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget({
    super.key,
    this.hasErr = false,
  });
  final bool hasErr;

  @override
  Widget build(BuildContext context) {
    const ColorFilter greyscale = ColorFilter.matrix(<double>[
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0.2126,
      0.7152,
      0.0722,
      0,
      0,
      0,
      0,
      0,
      1,
      0,
    ]);

    return Expanded(
      child: RepaintBoundary(
        child: hasErr
            ? ColorFiltered(
                colorFilter: greyscale,
                child: Image.asset(
                  AssetConstants.downloadImage,
                ),
              )
            : Image.asset(
                AssetConstants.downloadImage,
              )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .slideY(begin: 0.1, end: 0.15, duration: 600.ms, curve: Curves.easeIn)
                .shimmer(),
      ),
    );
  }
}
