import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../extensions/animations.dart';
import '../helpers/responsive_helper.dart';
import '../routing/app_routes.dart';

class NotFoundScreen extends StatelessWidget {
  final String routeName;

  const NotFoundScreen({super.key, required this.routeName});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 100.w,
              color: Colors.redAccent.withValues(alpha: 0.8),
            ).fadeInScale(),
            20.verticalSpace,
            Text(
              'Page Not Found',
              style: theme.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ).fadeInSlide(delay: 200, slideOffset: 0.3),

            10.verticalSpace,
            Text(
              routeName,
              style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
            ).fadeInSlide(delay: 300, duration: 400),
            30.verticalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              onPressed: () {
                context.pushReplacement(AppRoutes.home);
              },
              child: Text('Go to Home', style: TextStyle(fontSize: 16.sp)),
            ).fadeInSlide(delay: 400),
          ],
        ),
      ),
    );
  }
}
