import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/helpers/responsive_helper.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../widgets/ambient_blob.dart';
import '../widgets/email_form.dart';
import '../widgets/hero_section.dart';

class EmailEntryScreen extends StatelessWidget {
  const EmailEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                          onSubmit: (email) => context.push(
                            AppRoutes.otpVerification,
                            extra: email,
                          ),
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
