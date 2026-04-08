import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/animations.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/app_screen_header.dart';
import '../../../auth/providers/auth_session_provider.dart';
import '../widgets/home_category_filter_row.dart';
import '../widgets/secure_vault_banner.dart';
import '../widgets/vault_empty_state.dart';
import '../widgets/vault_fab.dart';
import '../widgets/vault_search_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasPin = ref.watch(
      authSessionProvider.select((s) => s.asData?.value.hasPin ?? false),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
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
                ),
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
                        SecureVaultBanner(
                        ).fadeInSlide(delay: 150),
                      ],
                      20.verticalSpace,
                      HomeCategoryFilterRow(
                        selected: _selectedCategory,
                        onChanged: (category) =>
                            setState(() => _selectedCategory = category),
                      ).fadeInSlide(delay: 250),
                      56.verticalSpace,
                      const VaultEmptyState(),
                      100.verticalSpace,
                    ]),
                  ),
                ),
              ],
            ),
            Positioned(
              right: 20.w,
              bottom: 28.h,
              child: VaultFab(
                enabled: hasPin,
              ).bounce(delay: 500),
            ),
          ],
        ),
      ),
    );
  }
}
