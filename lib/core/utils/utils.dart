import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../config/flavor_config.dart';
import '../helpers/responsive_helper.dart';

class Utils {
  Utils._();

  /// Cached once for optimal performance - no repeated checks
  static final bool _enableLogs = FlavorConfig.isDev;

  static void printLog(String message) {
    if (!_enableLogs) return;
    debugPrint(message);
  }

  // Cached UUID generator instance for efficient UUID generation
  static final _uuid = Uuid();
  static String generateUuid() => _uuid.v4();

  /// Generates a random password with a mix of characters, numbers, and symbols.
  static String generatePassword({int length = 16}) {
    const lower = 'abcdefghijklmnopqrstuvwxyz';
    const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*';
    const chars = '$lower$upper$numbers$symbols';
    final rng = Random.secure();
    return List.generate(
      length,
      (_) => chars[rng.nextInt(chars.length)],
    ).join();
  }

  static void unfocus(BuildContext context) => FocusScope.of(context).unfocus();

  static Future<T?> showDefaultBottomSheet<T>(
    BuildContext context,
    Widget widget,
    bool? isDismissible,
  ) => showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    isDismissible: isDismissible ?? true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.r),
        topRight: Radius.circular(16.r),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Wrap(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 14.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [widget, 10.verticalSpace],
              ),
            ),
          ],
        ),
      );
    },
  );

  static Future<T?> showDefaultDialog<T>(
    BuildContext context,
    Widget widget,
    Widget actions,
    bool? isDismissible,
  ) {
    return showDialog<T>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
          contentPadding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 20.w,
          ),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          content: widget,
          actions: [actions],
        );
      },
    );
  }
}
