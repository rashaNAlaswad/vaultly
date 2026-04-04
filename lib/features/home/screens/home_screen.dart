import 'package:flutter/material.dart';

import '../../../core/themes/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "You're in.",
          style: TextStyles.heroTitle,
        ),
      ),
    );
  }
}
