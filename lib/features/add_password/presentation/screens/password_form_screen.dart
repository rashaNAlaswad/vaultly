import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/extensions/animations.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/widgets/app_screen_header.dart';
import '../../../../core/widgets/app_snack_bar.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/utils/utils.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../../data/models/password_entry.dart';
import '../providers/passwords_provider.dart';
import '../providers/user_tags_provider.dart';
import '../widgets/add_tag_dialog.dart';
import '../widgets/category_section.dart';
import '../widgets/password_strength_row.dart';
import '../widgets/vault_identity_avatar.dart';

class PasswordFormScreen extends ConsumerStatefulWidget {
  const PasswordFormScreen({super.key, this.entry});

  /// Null → add mode. Not null → edit mode with pre-filled fields.
  final PasswordEntry? entry;

  @override
  ConsumerState<PasswordFormScreen> createState() => _PasswordFormScreenState();
}

class _PasswordFormScreenState extends ConsumerState<PasswordFormScreen> {
  final _formKey = GlobalKey<FormState>();

  late final _siteController =
      TextEditingController(text: widget.entry?.siteName ?? '');
  late final _usernameController =
      TextEditingController(text: widget.entry?.username ?? '');
  late final _passwordController =
      TextEditingController(text: widget.entry?.password ?? '');
  late final _notesController =
      TextEditingController(text: widget.entry?.notes ?? '');

  final _obscurePasswordNotifier = ValueNotifier<bool>(true);
  late final _selectedTagNotifier =
      ValueNotifier<String?>(widget.entry?.tags.firstOrNull);
  final _isSavingNotifier = ValueNotifier<bool>(false);

  bool get _isEditing => widget.entry != null;

  @override
  void dispose() {
    _siteController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _notesController.dispose();
    _obscurePasswordNotifier.dispose();
    _selectedTagNotifier.dispose();
    _isSavingNotifier.dispose();
    super.dispose();
  }

  void _generatePassword() {
    _passwordController.text = Utils.generatePassword();
  }

  Future<void> _showAddTagDialog() async {
    final tag = await AddTagDialog.show(context);
    if (tag == null) return;
    final added = await ref.read(userTagsProvider.notifier).addTag(tag);
    if (added) _selectedTagNotifier.value = tag;
  }

  Future<void> _onSave() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final selectedTag = _selectedTagNotifier.value;
    if (selectedTag == null) {
      AppSnackBar.error(context, 'Please select a tag.');
      return;
    }

    _isSavingNotifier.value = true;
    try {
      if (_isEditing) {
        await ref.read(passwordsProvider.notifier).updatePassword(
          widget.entry!.copyWith(
            siteName: _siteController.text.trim(),
            username: _usernameController.text.trim(),
            password: _passwordController.text,
            tags: [selectedTag],
            notes: _notesController.text.trim(),
          ),
        );
      } else {
        await ref.read(passwordsProvider.notifier).addPassword(
          siteName: _siteController.text.trim(),
          username: _usernameController.text.trim(),
          password: _passwordController.text,
          tags: [selectedTag],
          notes: _notesController.text.trim(),
        );
      }
      if (mounted) {
        AppSnackBar.success(context, 'Password saved!');
        context.pop();
      }
    } catch (_) {
      if (mounted) AppSnackBar.error(context, 'Failed to save. Please try again.');
    } finally {
      if (mounted) _isSavingNotifier.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppScreenHeader(
              title: _isEditing ? 'Edit Password' : 'New Password',
              trailing: Semantics(
                label: 'Save password',
                button: true,
                child: ValueListenableBuilder<bool>(
                  valueListenable: _isSavingNotifier,
                  builder: (context, isSaving, _) => TextButton(
                    onPressed: isSaving ? null : _onSave,
                    child: isSaving
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Save'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: context.responsive.edgeInsetsSymmetric(
                    horizontal: 24,
                  ),
                  children: [
                    32.verticalSpace,
                    ValueListenableBuilder<TextEditingValue>(
                      valueListenable: _siteController,
                      builder: (context, value, _) {
                        final text = value.text.trim();
                        final letter =
                            text.isEmpty ? 'V' : text[0].toUpperCase();
                        return VaultIdentityAvatar(letter: letter);
                      },
                    ).fadeInScale(delay: 0),
                    32.verticalSpace,
                    AppTextField(
                      controller: _siteController,
                      hint: 'e.g. Replit',
                      label: 'Site/App Name',
                      textInputAction: TextInputAction.next,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ).fadeInSlide(delay: 60),
                    20.verticalSpace,
                    AppTextField(
                      controller: _usernameController,
                      hint: 'user@example.com',
                      label: 'Username or Email',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Required' : null,
                      suffixIcon: const Icon(
                        Icons.person_outline_rounded,
                        color: AppColors.onSurfaceVariant,
                        size: 20,
                      ),
                    ).fadeInSlide(delay: 100),
                    20.verticalSpace,
                    ValueListenableBuilder<bool>(
                      valueListenable: _obscurePasswordNotifier,
                      builder: (context, obscure, _) => _PasswordField(
                        controller: _passwordController,
                        obscureText: obscure,
                        onToggleObscure: () =>
                            _obscurePasswordNotifier.value = !obscure,
                        onRegenerate: _generatePassword,
                      ).fadeInSlide(delay: 140),
                    ),
                    20.verticalSpace,
                    GradientButton(
                      label: 'Generate Secure Key',
                      onTap: _generatePassword,
                    ).fadeInSlide(delay: 180),
                    24.verticalSpace,
                    ValueListenableBuilder<String?>(
                      valueListenable: _selectedTagNotifier,
                      builder: (context, selected, _) {
                        final tags =
                            ref.watch(userTagsProvider).asData?.value ?? [];
                        return CategorySection(
                          tags: tags,
                          selected: selected,
                          onChanged: (t) => _selectedTagNotifier.value = t,
                          onAddTag: _showAddTagDialog,
                        ).fadeInSlide(delay: 220);
                      },
                    ),
                    20.verticalSpace,
                    AppTextField(
                      controller: _notesController,
                      hint: 'Secret questions, ...etc.',
                      label: 'Optional Notes',
                      maxLines: 3,
                      textInputAction: TextInputAction.done,
                    ).fadeInSlide(delay: 260),
                    32.verticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PasswordField extends StatelessWidget {
  const _PasswordField({
    required this.controller,
    required this.obscureText,
    required this.onToggleObscure,
    required this.onRegenerate,
  });

  final TextEditingController controller;
  final bool obscureText;
  final VoidCallback onToggleObscure;
  final VoidCallback onRegenerate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: controller,
          hint: '••••••••••••',
          label: 'Password',
          obscureText: obscureText,
          textInputAction: TextInputAction.done,
          validator: (v) => (v == null || v.isEmpty) ? 'Required' : null,
          suffixIcon: Semantics(
            label: obscureText ? 'Show password' : 'Hide password',
            button: true,
            child: GestureDetector(
              onTap: onToggleObscure,
              child: Icon(
                obscureText
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.onSurfaceVariant,
                size: 20,
              ),
            ),
          ),
        ),
        8.verticalSpace,
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: controller,
          builder: (_, value, _) => PasswordStrengthRow(
            password: value.text,
            onRegenerate: onRegenerate,
          ),
        ),
      ],
    );
  }
}
