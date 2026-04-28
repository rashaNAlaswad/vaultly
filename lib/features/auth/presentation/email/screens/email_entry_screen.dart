import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/widgets/app_snack_bar.dart';
import '../../providers/auth_providers.dart';
import '../../widgets/ambient_blob.dart';
import '../widgets/email_form.dart';
import '../widgets/hero_section.dart';

class EmailEntryScreen extends ConsumerStatefulWidget {
  const EmailEntryScreen({super.key});

  @override
  ConsumerState<EmailEntryScreen> createState() => _EmailEntryScreenState();
}

class _EmailEntryScreenState extends ConsumerState<EmailEntryScreen> {
  String? _submittedEmail;

  @override
  Widget build(BuildContext context) {
    ref.listen(sendOtpProvider, (_, state) {
      state.whenOrNull(
        data: (_) {
          if (_submittedEmail != null) {
            context.push(AppRoutes.otpVerification, extra: _submittedEmail);
          }
        },
        error: (e, _) => AppSnackBar.error(context, e.toString()),
      );
    });

    final state = ref.watch(sendOtpProvider);

    return Scaffold(
      body: Stack(
        children: [
          const AmbientBlob(
            color: AppColors.primaryGlow8,
            alignment: Alignment.topLeft,
          ),
          const AmbientBlob(
            color: AppColors.secondaryGlow5,
            alignment: Alignment.bottomRight,
          ),
          SafeArea(
            child: Column(
              children: [
                64.verticalSpace,
                Expanded(
                  child: SingleChildScrollView(
                    padding: context.responsive.edgeInsetsSymmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      children: [
                        60.verticalSpace,
                        const HeroSection(),
                        40.verticalSpace,
                        EmailForm(
                          isLoading: state.isLoading,
                          onSubmit: (email) {
                            _submittedEmail = email;
                            ref.read(sendOtpProvider.notifier).sendOtp(email);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
