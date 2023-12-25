import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../ui/ui_utils.dart';
import 'loader.dart';

class ColoredFillBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget label;
  final Color? backgroundColor;
  final bool enableBoxShadow;
  final double height, width;
  final bool? isLoading;

  const ColoredFillBtn({
    super.key,
    required this.onPressed,
    required this.label,
    this.backgroundColor = AppColorPallete.seedColor,
    this.enableBoxShadow = true,
    this.height = 48,
    this.width = 48,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = getColorScheme(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        boxShadow: enableBoxShadow
            ? [
                BoxShadow(
                  color: backgroundColor?.withOpacity(0.3) ?? scheme.shadow.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 6,
                  offset: const Offset(0, 6), // changes position of shadow
                ),
              ]
            : [],
        borderRadius: BorderRadius.circular(7),
        color: backgroundColor ?? scheme.surface,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(7),
        color: backgroundColor ?? scheme.surface,
        child: InkWell(
          borderRadius: BorderRadius.circular(7),
          onTap: isLoading != null && isLoading! ? null : onPressed,
          splashColor: scheme.outline,
          splashFactory: InkSplash.splashFactory,
          child: Center(
            // child: label,
            child: isLoading != null && isLoading!
                ? const SecondaryLoader(
                    color: Colors.white,
                    size: 18,
                  )
                : label,
          ),
        ),
      ),
    );
  }
}
