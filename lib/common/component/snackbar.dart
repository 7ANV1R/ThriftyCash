import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../ui/ui_utils.dart';

showErrorSnackbar(
    {required BuildContext context, String? title, String? message, SnackBarPosition? snackBarPosition}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(
      icon: const Icon(Icons.error_outline, color: Colors.red, size: 120),
      backgroundColor: getColorScheme(context).error,
      maxLines: 4,
      message: message ?? "Aw snap! Something went wrong.",
      textAlign: TextAlign.left,
    ),
    snackBarPosition: snackBarPosition ?? SnackBarPosition.top,
  );
}

showSuccessSnackbar(
    {required BuildContext context, String? title, String? message, SnackBarPosition? snackBarPosition}) {
  showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      icon: const Icon(Icons.sentiment_very_satisfied, color: Color(0xFF3C833E), size: 120),
      backgroundColor: Colors.green,
      maxLines: 4,
      message: message ?? "Aw snap! Something went wrong.",
      textAlign: TextAlign.left,
    ),
    displayDuration: const Duration(milliseconds: 2500),
    snackBarPosition: snackBarPosition ?? SnackBarPosition.top,
  );
}
