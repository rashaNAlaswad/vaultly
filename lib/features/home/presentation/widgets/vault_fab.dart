import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';

class VaultFab extends StatelessWidget {
  const VaultFab({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Add password',
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [AppColors.primary, AppColors.primaryContainer],
            ),
            shape: BoxShape.circle,
            boxShadow: const [
              BoxShadow(
                color: AppColors.primaryContainerGlow40,
                blurRadius: 25,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Icon(
            Icons.add_rounded,
            color: AppColors.onPrimary,
            size: 28.sp,
          ),
        ),
      ),
    );
  }
}
