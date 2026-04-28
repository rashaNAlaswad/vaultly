import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../../l10n/app_localizations.dart';

class VaultFab extends StatelessWidget {
  const VaultFab({super.key, this.enabled = true});

  final bool enabled;

  void _handleTap(BuildContext context) {
    if (enabled) {
      context.push(AppRoutes.addPassword);
      return;
    }
    AppSnackBar.info(context, AppLocalizations.of(context).createPinToAdd);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Semantics(
      label: 'Add password',
      button: true,
      enabled: enabled,
      child: Tooltip(
        message: enabled ? '' : AppLocalizations.of(context).createPinToAdd,
        triggerMode: TooltipTriggerMode.longPress,
        child: GestureDetector(
          onTap: () => _handleTap(context),
          child: AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: enabled ? 1.0 : 0.55,
            child: Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                gradient: enabled
                    ? LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorScheme.primary,
                          colorScheme.primaryContainer,
                        ],
                      )
                    : LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          colorScheme.primary.withValues(alpha: 0.08),
                          colorScheme.surfaceContainerHigh,
                        ],
                      ),
                shape: BoxShape.circle,
                boxShadow: enabled
                    ? [
                        BoxShadow(
                          color: colorScheme.primaryContainer
                              .withValues(alpha: 0.4),
                          blurRadius: 25,
                          offset: const Offset(0, 8),
                        ),
                      ]
                    : null,
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 350),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                ),
                child: Icon(
                  enabled ? Icons.add_rounded : Icons.lock_rounded,
                  key: ValueKey(enabled),
                  color: enabled
                      ? colorScheme.onPrimary
                      : colorScheme.onSurfaceVariant,
                  size: 28.sp,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
