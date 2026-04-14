import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../widgets/ambient_blob.dart';

class PinScaffold extends StatelessWidget {
  const PinScaffold({super.key, required this.hero, required this.dotRow, required this.keypad});

  final Widget hero;
  final Widget dotRow;
  final Widget keypad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const AmbientBlob(
            color: AppColors.primaryGlow8,
            alignment: Alignment.topRight,
          ),
          const AmbientBlob(
            color: AppColors.secondaryGlow5,
            alignment: Alignment.bottomLeft,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: context.responsive.edgeInsetsSymmetric(horizontal: 24),
              child: Column(
                children: [
                  48.verticalSpace,
                  hero,
                  40.verticalSpace,
                  dotRow,
                  48.verticalSpace,
                  keypad,
                  200.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
