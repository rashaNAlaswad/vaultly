import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/responsive_helper.dart';
import '../themes/text_styles.dart';

/// A reusable, themed text field used across the app.
///
/// Renders an optional labelled [TextFormField] whose border, fill, and hint
/// styles are derived from the ambient [InputDecorationTheme] defined in
/// [AppTheme]. Use [keyboardType] to switch between text, email, number,
/// and other input modes.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.label,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.inputFormatters,
    this.focusNode,
  });

  final TextEditingController controller;
  final String hint;

  /// Optional label rendered above the field in uppercase tracking style.
  final String? label;

  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final ValueChanged<String>? onChanged;

  /// Widget placed at the trailing edge of the field (e.g. an icon button).
  final Widget? suffixIcon;

  /// Widget placed at the leading edge of the field.
  final Widget? prefixIcon;

  final bool obscureText;
  final bool readOnly;
  final bool autofocus;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Padding(
            padding: context.responsive.edgeInsets(start: 16, bottom: 8),
            child: Text(label!.toUpperCase(), style: TextStyles.fieldLabel),
          ),
        ],
        Semantics(
          label: label ?? hint,
          textField: true,
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            obscureText: obscureText,
            readOnly: readOnly,
            autofocus: autofocus,
            maxLines: obscureText ? 1 : maxLines,
            inputFormatters: inputFormatters,
            style: TextStyles.inputText,
            validator: validator,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyles.inputHint,
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: context.responsive.edgeInsets(end: 8),
                      child: suffixIcon,
                    )
                  : null,
              prefixIcon: prefixIcon != null
                  ? Padding(
                      padding: context.responsive.edgeInsets(start: 16),
                      child: prefixIcon,
                    )
                  : null,
              suffixIconConstraints: suffixIcon != null
                  ? const BoxConstraints()
                  : null,
              prefixIconConstraints: prefixIcon != null
                  ? const BoxConstraints()
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
