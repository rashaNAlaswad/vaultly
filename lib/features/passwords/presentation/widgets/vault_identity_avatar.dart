import 'package:flutter/material.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/text_styles.dart';
import '../../../../../l10n/app_localizations.dart';

class VaultIdentityAvatar extends StatelessWidget {
  const VaultIdentityAvatar({super.key, required this.letter});

  final String letter;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Semantics(
      label: 'Vault identity avatar: $letter',
      child: Column(
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primaryContainer,
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 24,
                ),
              ],
            ),
            child: Center(
              child: Text(
                letter,
                style: TextStyles.heroTitle.copyWith(
                  color: colorScheme.onPrimaryContainer,
                  fontSize: 40.sp,
                ),
              ),
            ),
          ),
          12.verticalSpace,
          Text(
            AppLocalizations.of(context).vaultIdentity,
            style: TextStyles.fieldLabel.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
