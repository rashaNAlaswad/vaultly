import 'package:flutter/material.dart';

import '../../../../core/helpers/responsive_helper.dart';

class SettingsIconAvatar extends StatelessWidget {
  const SettingsIconAvatar({
    super.key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
      child: Icon(icon, color: iconColor, size: 22.sp),
    );
  }
}
