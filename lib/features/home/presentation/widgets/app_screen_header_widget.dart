import 'package:flutter/material.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/app_screen_header.dart';

class AppScreenHeaderWidget extends StatelessWidget {
  const AppScreenHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: AppScreenHeader(
        showBackButton: false,
        titleWidget: Text('Hello!', style: TextStyles.screenTitle),
        trailing: Semantics(
          label: 'Settings',
          button: true,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.settings_outlined,
              color: AppColors.onSurfaceVariant,
              size: 22.sp,
            ),
          ),
        ),
      ),
    );
  }
}
