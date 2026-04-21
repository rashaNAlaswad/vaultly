import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/animations.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/app_screen_header.dart';
import '../../../../l10n/app_localizations.dart';
import '../../../passwords/presentation/providers/passwords_provider.dart';
import '../../../auth/presentation/providers/auth_session_provider.dart';
import '../../data/models/settings_state.dart';
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

    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppScreenHeader(
              titleWidget: Text(l10n.settings, style: TextStyles.screenTitle),
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
                  SettingsSectionHeader(
                    title: l10n.settingsAuthSection,
                    icon: Icons.shield_rounded,
                  ).fadeInSlide(delay: 150),
                  12.verticalSpace,
                  SettingsNavCard(
                    icon: Icons.password_rounded,
                    title: l10n.settingsChangeMasterPin,
                    subtitle: hasPin
                        ? l10n.settingsChangeMasterPinSubtitle
                        : l10n.settingsSetupPinFirst,
                    enabled: hasPin,
                    onTap: () => context.push(AppRoutes.changePin),
                  ).listItemAnimation(index: 0, baseDelay: 200),
                  12.verticalSpace,
                  SettingsToggleCard(
                    icon: Icons.fingerprint_rounded,
                    title: l10n.settingsBiometricUnlock,
                    subtitle: l10n.settingsBiometricUnlockSubtitle,
                    value: settings.biometricUnlock,
                    onChanged: notifier.setBiometricUnlock,
                  ).listItemAnimation(index: 1, baseDelay: 200),
                  32.verticalSpace,
                  SettingsSectionHeader(
                    title: l10n.settingsAutoLockSection,
                    icon: Icons.timer_rounded,
                  ).fadeInSlide(delay: 380),
                  12.verticalSpace,
                  SettingsToggleCard(
                    icon: Icons.visibility_off_rounded,
                    title: l10n.settingsLockOnBackground,
                    subtitle: l10n.settingsLockOnBackgroundSubtitle,
                    value: settings.lockOnBackground,
                    onChanged: notifier.setLockOnBackground,
                  ).listItemAnimation(index: 1, baseDelay: 430),
                  32.verticalSpace,
                  SettingsSectionHeader(
                    title: l10n.settingsAppearanceSection,
                    icon: Icons.palette_rounded,
                  ).fadeInSlide(delay: 480),
                  12.verticalSpace,
                  SettingsDropdownCard<ThemeMode>(
                    icon: Icons.brightness_6_rounded,
                    title: l10n.settingsTheme,
                    subtitle: l10n.settingsThemeSubtitle,
                    value: settings.themeMode,
                    items: [
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text(l10n.settingsThemeSystem),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text(l10n.settingsThemeLight),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text(l10n.settingsThemeDark),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        notifier.setThemeMode(value);
                      }
                    },
                  ).listItemAnimation(index: 1, baseDelay: 530),
                  32.verticalSpace,
                  SettingsSectionHeader(
                    title: l10n.settingsLanguageSection,
                    icon: Icons.language_rounded,
                  ).fadeInSlide(delay: 580),
                  12.verticalSpace,
                  SettingsDropdownCard<String>(
                    icon: Icons.translate_rounded,
                    title: l10n.settingsAppLanguage,
                    subtitle: l10n.settingsAppLanguageSubtitle,
                    value: settings.locale.languageCode,
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
                        notifier.setLocale(Locale(value));
                      }
                    },
                  ).listItemAnimation(index: 1, baseDelay: 630),
                  32.verticalSpace,
                  SettingsSectionHeader(
                    title: l10n.settingsDataSection,
                    icon: Icons.cloud_sync_rounded,
                  ).fadeInSlide(delay: 780),
                  12.verticalSpace,
                  SettingsDangerCard(
                    icon: Icons.delete_forever_rounded,
                    title: l10n.settingsWipeAllData,
                    subtitle: l10n.settingsWipeAllDataSubtitle,
                    confirmTitle: l10n.settingsWipeAllDataConfirmTitle,
                    confirmMessage: l10n.settingsWipeAllDataConfirmMessage,
                    onConfirmed: () async {
                      await ref
                          .read(passwordsProvider.notifier)
                          .deleteAllPasswords();
                    },
                  ).listItemAnimation(index: 1, baseDelay: 830),
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
