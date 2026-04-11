import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/extensions/animations.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../add_password/data/models/password_entry.dart';
import 'password_card.dart';
import 'vault_empty_state.dart';

class PasswordsSliver extends StatelessWidget {
  const PasswordsSliver({
    super.key,
    required this.passwordsAsync,
    required this.searchListenable,
    required this.categoryListenable,
    required this.onDelete,
  });

  final AsyncValue<List<PasswordEntry>> passwordsAsync;
  final ValueListenable<TextEditingValue> searchListenable;
  final ValueListenable<String> categoryListenable;
  final ValueChanged<String> onDelete;

  List<PasswordEntry> _filter(List<PasswordEntry> entries) {
    final query = searchListenable.value.text.toLowerCase().trim();
    final category = categoryListenable.value;
    return entries.where((e) {
      final matchesCategory = category == 'All' || e.tags.contains(category);
      final matchesSearch =
          query.isEmpty ||
          e.siteName.toLowerCase().contains(query) ||
          e.username.toLowerCase().contains(query);
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return passwordsAsync.when(
      loading: () => const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 48),
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (e, _) => SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 48),
          child: Center(
            child: Text(
              'Could not load passwords.',
              style: TextStyles.captionMuted,
            ),
          ),
        ),
      ),
      data: (entries) => ListenableBuilder(
        listenable: Listenable.merge([searchListenable, categoryListenable]),
        builder: (context, _) {
          final filtered = _filter(entries);
          if (filtered.isEmpty) {
            return const SliverToBoxAdapter(child: VaultEmptyState());
          }
          return SliverPadding(
            padding: context.responsive.edgeInsetsSymmetric(horizontal: 20),
            sliver: SliverList.separated(
              itemCount: filtered.length,
              separatorBuilder: (_, _) => 12.verticalSpace,
              itemBuilder: (context, i) {
                final item = filtered[i];
                return RepaintBoundary(
                  child: PasswordCard(
                    key: ValueKey(item.id),
                    entry: item,
                    onDelete: () => onDelete(item.id),
                  ).listItemAnimation(index: i),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
