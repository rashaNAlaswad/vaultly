import 'package:flutter/material.dart' show Color;

import '../themes/app_colors.dart';

enum PasswordStrength { weak, moderate, secure }

extension PasswordStrengthX on PasswordStrength {
  String get label => switch (this) {
    PasswordStrength.weak => 'WEAK',
    PasswordStrength.moderate => 'MODERATE',
    PasswordStrength.secure => 'SECURE',
  };

  Color get color => switch (this) {
    PasswordStrength.weak => AppColors.error,
    PasswordStrength.moderate => AppColors.warning,
    PasswordStrength.secure => AppColors.success,
  };

  /// Glow shadow color for the filled dot.
  Color get glowColor => switch (this) {
    PasswordStrength.weak => AppColors.errorGlow20,
    PasswordStrength.moderate => AppColors.warningGlow60,
    PasswordStrength.secure => AppColors.successGlow60,
  };

  /// Number of filled dots out of 3.
  int get filledDots => switch (this) {
    PasswordStrength.weak => 1,
    PasswordStrength.moderate => 2,
    PasswordStrength.secure => 3,
  };
}

/// Evaluates a raw password string and returns its [PasswordStrength].
/// Returns null when the password is empty.
PasswordStrength? evaluateStrength(String password) {
  if (password.isEmpty) return null;
  int score = 0;
  if (password.length >= 8) score++;
  if (password.length >= 12) score++;
  if (RegExp(r'[A-Z]').hasMatch(password)) score++;
  if (RegExp(r'[a-z]').hasMatch(password)) score++;
  if (RegExp(r'[0-9]').hasMatch(password)) score++;
  if (RegExp(r'[^A-Za-z0-9]').hasMatch(password)) score++;

  if (score <= 3) return PasswordStrength.weak;
  if (score <= 4) return PasswordStrength.moderate;
  return PasswordStrength.secure;
}
