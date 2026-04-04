import 'package:flutter/material.dart';

/// Decorative radial glow blob placed at screen corners.
class AmbientBlob extends StatelessWidget {
  const AmbientBlob({super.key, required this.color, required this.alignment});

  final Color color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTop = alignment == Alignment.topLeft || alignment == Alignment.topRight;
    final isLeft = alignment == Alignment.topLeft || alignment == Alignment.bottomLeft;

    return Positioned(
      top: isTop ? -80 : null,
      bottom: isTop ? null : -80,
      left: isLeft ? -80 : null,
      right: isLeft ? null : -80,
      child: Container(
        width: size.width * 0.45,
        height: size.height * 0.315,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}
