import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/extensions/string_extensions.dart';
import '../../../../../core/helpers/responsive_helper.dart';
import '../../../../../core/widgets/app_text_field.dart';
import '../../../../../core/widgets/gradient_button.dart';
import '../../../../../l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context);
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextField(
            controller: _controller,
            label: l10n.emailLabel,
            hint: l10n.emailHint,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _submit(),
            suffixIcon: const EmailSuffixIcon(),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return l10n.emailRequired;
              }
              if (!value.trim().isValidEmail) {
                return l10n.emailInvalid;
              }
              return null;
            },
          ),
          24.verticalSpace,
          GradientButton(
            label: l10n.sendCode,
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
    final colorScheme = Theme.of(context).colorScheme;
    return Icon(
      Icons.alternate_email,
      color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
      size: 20,
    );
  }
}
