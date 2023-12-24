import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../ui/ui_utils.dart';

class LinearLoader extends StatelessWidget {
  const LinearLoader({
    super.key,
    this.loaderColor,
    this.bgColor,
  });
  final Color? loaderColor, bgColor;

  @override
  Widget build(BuildContext context) {
    final scheme = getColorScheme(context);
    return LinearProgressIndicator(
      backgroundColor: bgColor ?? scheme.surface,
      color: loaderColor ?? scheme.primary,
    );
  }
}

class PrimaryLoader extends StatelessWidget {
  const PrimaryLoader({super.key, this.size = 12, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitFoldingCube(
        color: color ?? getColorScheme(context).primary,
        size: size,
      ),
    );
  }
}

class SecondaryLoader extends StatelessWidget {
  const SecondaryLoader({super.key, this.size = 12, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWave(
        color: color ?? getColorScheme(context).primary,
        size: size,
      ),
    );
  }
}

class LoaderPage extends StatelessWidget {
  const LoaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: PrimaryLoader()),
    );
  }
}
