import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/helpers/app_regexp.dart';
import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/themes/app_colors.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/gradient_button.dart';

class EmailForm extends StatefulWidget {
  const EmailForm({
    super.key,
    required this.onSubmit,
    this.isLoading = false,
  });

  final ValueChanged<String> onSubmit;
  final bool isLoading;

  @override
  State<EmailForm> createState() => _EmailFormState();
}

class _EmailFormState extends State<EmailForm> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      widget.onSubmit(_controller.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: _controller,
            label: 'Secure Email Address',
            hint: 'name@example.com',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submit(),
            suffixIcon: const EmailSuffixIcon(),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter your email';
              }
              if (!AppRegExp.isEmailValid(value.trim())) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          24.verticalSpace,
          GradientButton(
            label: 'Send Verification Code',
            icon: Icons.arrow_forward,
            onTap: _submit,
            isLoading: widget.isLoading,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 300.ms, duration: 600.ms).slideY(begin: 0.1);
  }
}

class EmailSuffixIcon extends StatelessWidget {
  const EmailSuffixIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.alternate_email,
      color: AppColors.onSurfaceVariantHalf,
      size: 20,
    );
  }
}
