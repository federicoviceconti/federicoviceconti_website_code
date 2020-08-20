import 'package:flutter/material.dart';

class ParallaxWidget extends StatelessWidget {
  final Widget child;
  final bool isDefaultPosition;
  final double percentageX, percentageY;
  final double rotationOffset;

  const ParallaxWidget({
    Key key,
    this.isDefaultPosition,
    this.percentageX,
    this.percentageY,
    this.child,
    this.rotationOffset
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..translate(
          isDefaultPosition ? 0.0 : (70 * (percentageX / 50) + -70),
          isDefaultPosition ? 0.0 : (80 * (percentageY / 50) + -80),
          0.0,
        )
        ..rotateY(percentageY / rotationOffset)
        ..rotateX(percentageX / rotationOffset),
      alignment: FractionalOffset.center,
      child: child,
    );
  }
}
