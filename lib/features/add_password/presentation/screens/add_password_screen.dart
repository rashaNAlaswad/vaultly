import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../core/extensions/animations.dart';
import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/widgets/app_screen_header.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/gradient_button.dart';
import '../widgets/category_tag_row.dart';
import '../widgets/password_strength_row.dart';
import '../widgets/vault_identity_avatar.dart';

class AddPasswordScreen extends StatefulWidget {
  const AddPasswordScreen({super.key});

  @override
  State<AddPasswordScreen> createState() => _AddPasswordScreenState();
}

class _AddPasswordScreenState extends State<AddPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final _siteController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _notesController = TextEditingController();

  bool _obscurePassword = true;
  String _selectedTag = 'Social';
  String _passwordValue = '';

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(
      () => setState(() => _passwordValue = _passwordController.text),
    );
    _siteController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _siteController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  String get _avatarLetter {
    final text = _siteController.text.trim();
    if (text.isEmpty) return 'N';
    return text[0].toUpperCase();
  }

  void _generatePassword() {
    const lower = 'abcdefghijklmnopqrstuvwxyz';
    const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const numbers = '0123456789';
    const symbols = '!@#\$%^&*';
    const allChars = '$lower$upper$numbers$symbols';
    final rng = Random.secure();
    _passwordController.text = List.generate(
      16,
      (_) => allChars[rng.nextInt(allChars.length)],
    ).join();
  }

  void _onSave() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
  }

  Widget _passwordField() {
    return Column(
      children: [
        AppTextField(
          controller: _passwordController,
          hint: '••••••••••••',
          label: 'Password',
          obscureText: _obscurePassword,
          textInputAction: TextInputAction.done,
          suffixIcon: Semantics(
            label: _obscurePassword ? 'Show password' : 'Hide password',
            button: true,
            child: GestureDetector(
              onTap: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
              child: Icon(
                _obscurePassword
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.onSurfaceVariant,
                size: 20,
              ),
            ),
          ),
        ),
        8.verticalSpace,
        PasswordStrengthRow(
          password: _passwordValue,
          onRegenerate: _generatePassword,
        ),
      ],
    );
  }

  Widget _categorySection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.responsive.edgeInsets(left: 4, bottom: 8),
          child: Text('Category Tags', style: TextStyles.captionMuted),
        ),
        CategoryTagRow(
          selected: _selectedTag,
          onChanged: (t) => setState(() => _selectedTag = t),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppScreenHeader(
              title: 'New Password',
              trailing: Semantics(
                label: 'Save password',
                button: true,
                child: TextButton(onPressed: _onSave, child: const Text('Save')),
              ),
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: context.responsive.edgeInsetsSymmetric(horizontal: 24),
                  children: [
                    32.verticalSpace,
                    VaultIdentityAvatar(letter: _avatarLetter).fadeInScale(delay: 0),
                    32.verticalSpace,
                    AppTextField(
                      controller: _siteController,
                      hint: 'e.g. Replit',
                      label: 'Site/App Name',
                      textInputAction: TextInputAction.next,
                    ).fadeInSlide(delay: 60),
                    20.verticalSpace,
                    AppTextField(
                      controller: _usernameController,
                      hint: 'user@example.com',
                      label: 'Username',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      suffixIcon: const Icon(
                        Icons.person_outline_rounded,
                        color: AppColors.onSurfaceVariant,
                        size: 20,
                      ),
                    ).fadeInSlide(delay: 100),
                    20.verticalSpace,
                    _passwordField().fadeInSlide(delay: 140),
                    20.verticalSpace,
                    GradientButton(
                      label: 'Generate Secure Key',
                      onTap: _generatePassword,
                    ).fadeInSlide(delay: 180),
                    24.verticalSpace,
                    _categorySection(context).fadeInSlide(delay: 220),
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
