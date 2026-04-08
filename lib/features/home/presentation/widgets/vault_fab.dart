import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../core/routing/app_routes.dart';

class VaultFab extends StatelessWidget {
  const VaultFab({super.key, this.enabled = true});

  final bool enabled;

  void _handleTap(BuildContext context) {
    if (enabled) {
      context.push(AppRoutes.addPassword);
      return;
    }
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger == null) return;
    messenger.clearSnackBars();
    messenger.showSnackBar(
      const SnackBar(
        content: Text('Create a PIN to add passwords to your vault'),
        duration: Duration(seconds: 4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    return Semantics(
      label: 'Add password',
      button: true,
      enabled: enabled,
      child: Tooltip(
        message: enabled ? '' : 'Create a PIN to add passwords',
        triggerMode: TooltipTriggerMode.longPress,
        child: GestureDetector(
          onTap: () => _handleTap(context),
          child: AnimatedOpacity(
            duration: reduceMotion
                ? Duration.zero
                : const Duration(milliseconds: 300),
            opacity: enabled ? 1.0 : 0.55,
            child: Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                gradient: enabled
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.primary, AppColors.primaryContainer],
                      )
                    : const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.primaryGlow8,
                          AppColors.surfaceContainerHigh,
                        ],
                      ),
                shape: BoxShape.circle,
                boxShadow: enabled
                    ? const [
                        BoxShadow(
                          color: AppColors.primaryContainerGlow40,
                          blurRadius: 25,
                          offset: Offset(0, 8),
                        ),
                      ]
                    : null,
              ),
              child: AnimatedSwitcher(
                duration: reduceMotion
                    ? Duration.zero
                    : const Duration(milliseconds: 350),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(scale: animation, child: child),
                ),
                child: Icon(
                  enabled ? Icons.add_rounded : Icons.lock_rounded,
                  key: ValueKey(enabled),
                  color: enabled
                      ? AppColors.onPrimary
                      : AppColors.onSurfaceVariant,
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
