import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';

import '../../../../core/extensions/animations.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../passwords/presentation/providers/passwords_provider.dart';
import '../../../passwords/presentation/providers/user_tags_provider.dart';
import '../../../auth/presentation/providers/auth_session_provider.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../passwords/data/models/password_entry.dart';
import '../widgets/app_screen_header_widget.dart';
import '../widgets/home_category_filter_row.dart';
import '../widgets/passwords_sliver.dart';
import '../widgets/secure_vault_banner.dart';
import '../widgets/vault_fab.dart';
import '../widgets/vault_search_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _searchController = TextEditingController();
  final _categoryNotifier = ValueNotifier<String>('All');

  @override
  void dispose() {
    _searchController.dispose();
    _categoryNotifier.dispose();
    super.dispose();
  }

  Future<void> _delete(String id) async {
    final l10n = AppLocalizations.of(context);
    try {
      await ref.read(passwordsProvider.notifier).deletePassword(id);
      if (mounted) AppSnackBar.success(context, l10n.passwordDeleted);
    } catch (_) {
      if (mounted) AppSnackBar.error(context, l10n.failedToDelete);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasPin = ref.watch(
      authSessionProvider.select((s) => s.asData?.value.hasPin ?? false),
    );
    final passwordsAsync = ref.watch(passwordsProvider);
    final filterCategories = <String>[
      'All',
      ...ref.watch(userTagsProvider).asData?.value ?? <String>[],
    ];

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const AppScreenHeaderWidget(),
                SliverPadding(
                  padding: context.responsive.edgeInsetsSymmetric(
                    horizontal: 20,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      VaultSearchBar(
                        controller: _searchController,
                      ).fadeInSlide(delay: 50),
                      if (!hasPin) ...[
                        20.verticalSpace,
                        const RepaintBoundary(
                          child: SecureVaultBanner(),
                        ).fadeInSlide(delay: 150),
                      ],
                      20.verticalSpace,
                      ValueListenableBuilder<String>(
                        valueListenable: _categoryNotifier,
                        builder: (context, selected, _) =>
                            HomeCategoryFilterRow(
                              categories: filterCategories,
                              selected: selected,
                              onChanged: (c) => _categoryNotifier.value = c,
                            ),
                      ).fadeInSlide(delay: 250),
                      20.verticalSpace,
                    ]),
                  ),
                ),
                PasswordsSliver(
                  passwordsAsync: passwordsAsync,
                  searchListenable: _searchController,
                  categoryListenable: _categoryNotifier,
                  onDelete: (id) => _delete(id),
                  onTap: (PasswordEntry entry) => context.push(
                    AppRoutes.passwordDetail,
                    extra: entry,
                  ),
                ),
                SliverToBoxAdapter(child: 100.verticalSpace),
              ],
            ),
            PositionedDirectional(
              end: 20.w,
              bottom: 28.h,
              child: VaultFab(enabled: hasPin).bounce(delay: 500),
            ),
          ],
        ),
      ),
    );
  }
}
