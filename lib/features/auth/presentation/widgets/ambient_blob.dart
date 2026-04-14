import 'package:flutter/material.dart';

/// Decorative radial glow blob placed at screen corners.
class AmbientBlob extends StatelessWidget {
  const AmbientBlob({super.key, required this.color, required this.alignment});

  final Color color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Align(
      alignment: alignment,
      child: Transform.translate(
        offset: _overflowOffset,
        child: Container(
          width: size.width * 0.45,
          height: size.height * 0.315,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
      ),
    );
  }

  Offset get _overflowOffset {
    final isTop = alignment == Alignment.topLeft || alignment == Alignment.topRight;
    final isLeft = alignment == Alignment.topLeft || alignment == Alignment.bottomLeft;
    return Offset(
      isLeft ? -80 : 80,
      isTop ? -80 : 80,
    );
  }
}
