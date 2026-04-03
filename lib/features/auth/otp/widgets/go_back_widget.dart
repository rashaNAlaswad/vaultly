import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';

class GoBackWidget extends StatelessWidget {
  const GoBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.responsive.edgeInsetsSymmetric(horizontal: 24),
      child: Row(
        children: [
          Semantics(
            label: 'Go back',
            button: true,
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.primary,
                size: 22.sp,
              ),
            ),
          ),
          16.horizontalSpace,
          Text('Verify Email', style: TextStyles.screenTitle),
        ],
      ),
    );
  }
}
