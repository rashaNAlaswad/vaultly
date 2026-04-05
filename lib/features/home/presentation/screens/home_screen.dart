import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/animations.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/app_screen_header.dart';
import '../widgets/home_category_filter_row.dart';
import '../widgets/secure_vault_banner.dart';
import '../widgets/vault_empty_state.dart';
import '../widgets/vault_fab.dart';
import '../widgets/vault_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                      20.verticalSpace,
                      SecureVaultBanner(
                        onCreatePin: () {},
                      ).fadeInSlide(delay: 150),
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

            // FAB pinned to bottom-right
            Positioned(
              right: 20.w,
              bottom: 28.h,
              child: VaultFab(
                onTap: () {
                  context.push(AppRoutes.addPassword);
                },
              ).bounce(delay: 500),
            ),
          ],
        ),
      ),
    );
  }
}
