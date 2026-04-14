import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/routing/app_routes.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/app_screen_header.dart';
import '../../../../l10n/app_localizations.dart';

class AppScreenHeaderWidget extends ConsumerWidget {
  const AppScreenHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      elevation: 0,
      flexibleSpace: AppScreenHeader(
        showBackButton: false,
        titleWidget: Text(l10n.hello, style: TextStyles.screenTitle),
        trailing: Semantics(
          label: l10n.settings,
          button: true,
          child: IconButton(
            onPressed: () {
              context.push(AppRoutes.settings);
            },
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
