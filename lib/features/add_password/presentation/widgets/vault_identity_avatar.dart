import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';

class VaultIdentityAvatar extends StatelessWidget {
  const VaultIdentityAvatar({super.key, required this.letter});

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Vault identity avatar: $letter',
      child: Column(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryContainer,
              boxShadow: const [
                BoxShadow(color: AppColors.primaryGlow30, blurRadius: 24),
              ],
            ),
            child: Center(
              child: Text(
                letter,
                style: TextStyles.heroTitle.copyWith(
                  color: AppColors.onPrimaryContainer,
                  fontSize: 40.sp,
                ),
              ),
            ),
          ),
          12.verticalSpace,
          Text(
            AppLocalizations.of(context).vaultIdentity,
            style: TextStyles.fieldLabel,
          ),
        ],
      ),
    );
  }
}
