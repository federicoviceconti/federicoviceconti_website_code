import 'package:flutter/material.dart';

class ParallaxWidget extends StatelessWidget {
  final Widget child;
  final bool? isDefaultPosition;
  final double? percentageX, percentageY;
  final double? rotationOffset;

  const ParallaxWidget({
    Key? key,
    this.isDefaultPosition,
    this.percentageX,
    this.percentageY,
    required this.child,
    this.rotationOffset
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool defaultPosition = isDefaultPosition ?? false;
    final double x = percentageX ?? 0.0;
    final double y = percentageY ?? 0.0;
    final double rotation = rotationOffset ?? 0.0;

    return Transform(
      transform: Matrix4.identity()
        ..translate(
          defaultPosition ? 0.0 : (70 * (x / 50) + -70),
          defaultPosition ? 0.0 : (80 * (y / 50) + -80),
          0.0,
        )
        ..rotateY(y / rotation)
        ..rotateX(x / rotation),
      alignment: FractionalOffset.center,
      child: child,
    );
  }
}
