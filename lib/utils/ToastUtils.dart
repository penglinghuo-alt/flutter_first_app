import 'package:flutter/material.dart';

enum ToastType { success, error, info }

class ToastUtils {
  static void showToast(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
    ToastType type = ToastType.info,
  }) {
    Color backgroundColor;
    switch (type) {
      case ToastType.success:
        backgroundColor = const Color(0xFF52C41A);
        break;
      case ToastType.error:
        backgroundColor = const Color(0xFFFF4D4F);
        break;
      case ToastType.info:
        backgroundColor = const Color(0xFF1890FF);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 140,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        behavior: SnackBarBehavior.floating,
        duration: duration,
        backgroundColor: backgroundColor,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  static void showSuccess(BuildContext context, String message) {
    showToast(context, message, type: ToastType.success);
  }

  static void showError(BuildContext context, String message) {
    showToast(context, message, type: ToastType.error);
  }
}
