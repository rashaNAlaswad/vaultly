import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/animations.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/providers/locale_provider.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/app_screen_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../add_password/presentation/providers/passwords_provider.dart';
import '../../../auth/providers/auth_session_provider.dart';
import '../providers/settings_provider.dart';
import '../widgets/settings_danger_card.dart';
import '../widgets/settings_dropdown_card.dart';
import '../widgets/settings_nav_card.dart';
import '../widgets/settings_section_header.dart';
import '../widgets/settings_toggle_card.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider).value ?? const SettingsState();
    final notifier = ref.read(settingsProvider.notifier);
    final hasPin = ref.watch(
      authSessionProvider.select((s) => s.asData?.value.hasPin ?? false),
    );
    final locale = ref.watch(localeProvider).value ?? const Locale('en');

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppScreenHeader(
              titleWidget: Text('Settings', style: TextStyles.screenTitle),
              onBack: () =>
                  context.canPop() ? context.pop() : context.go(AppRoutes.home),
            ).fadeInSlide(delay: 0),
            Expanded(
              child: ListView(
                padding: context.responsive.edgeInsets(
                  horizontal: 24.0,
                  vertical: 8.0,
                ),
                children: [
                  const SettingsSectionHeader(
                    title: 'Authentication',
                    icon: Icons.shield_rounded,
                  ).fadeInSlide(delay: 150),
                  12.verticalSpace,
                  SettingsNavCard(
                    icon: Icons.password_rounded,
                    title: 'Change Master PIN',
                    subtitle: hasPin
                        ? 'Update your 6-digit access code'
                        : 'Set up a PIN first',
                    enabled: hasPin,
                    onTap: () => context.push(AppRoutes.changePin),
                  ).listItemAnimation(index: 0, baseDelay: 200),
                  12.verticalSpace,
                  SettingsToggleCard(
                    icon: Icons.fingerprint_rounded,
                    title: 'Biometric Unlock',
                    subtitle: 'Use Face ID or Fingerprint',
                    value: settings.biometricUnlock,
                    onChanged: notifier.setBiometricUnlock,
                  ).listItemAnimation(index: 1, baseDelay: 200),
                  32.verticalSpace,
                  const SettingsSectionHeader(
                    title: 'Auto-lock',
                    icon: Icons.timer_rounded,
                  ).fadeInSlide(delay: 380),
                  12.verticalSpace,
                  SettingsToggleCard(
                    icon: Icons.visibility_off_rounded,
                    title: 'Lock on Background',
                    subtitle: 'Lock when app is minimized',
                    value: settings.lockOnBackground,
                    onChanged: notifier.setLockOnBackground,
                  ).listItemAnimation(index: 1, baseDelay: 430),
                  32.verticalSpace,
                  const SettingsSectionHeader(
                    title: 'Language',
                    icon: Icons.language_rounded,
                  ).fadeInSlide(delay: 510),
                  12.verticalSpace,
                  SettingsDropdownCard<String>(
                    icon: Icons.translate_rounded,
                    title: 'App Language',
                    subtitle: 'Choose your preferred language',
                    value: locale.languageCode,
                    items: AppLocalizations.supportedLocales
                        .map(
                          (l) => DropdownMenuItem(
                            value: l.languageCode,
                            child: Text(AppStrings.localeDisplayName(l.languageCode)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        ref
                            .read(localeProvider.notifier)
                            .setLocale(Locale(value));
                      }
                    },
                  ).listItemAnimation(index: 1, baseDelay: 560),
                  32.verticalSpace,
                  const SettingsSectionHeader(
                    title: 'Data',
                    icon: Icons.cloud_sync_rounded,
                  ).fadeInSlide(delay: 710),
                  12.verticalSpace,
                  SettingsDangerCard(
                    icon: Icons.delete_forever_rounded,
                    title: 'Wipe All Data',
                    subtitle: 'Irreversible. Permanent vault deletion.',
                    confirmTitle: 'Wipe All Data?',
                    confirmMessage:
                        'This will permanently delete all your vault data. '
                        'This action cannot be undone.',
                    onConfirmed: () async {
                      await ref
                          .read(passwordsProvider.notifier)
                          .deleteAllPasswords();
                    },
                  ).listItemAnimation(index: 1, baseDelay: 760),
                  20.verticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
