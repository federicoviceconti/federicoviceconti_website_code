import 'package:flutter/material.dart';

class FullScreenWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final Alignment? alignment;
  final Widget child;

  const FullScreenWidget({
    Key? key,
    this.padding,
    this.alignment,
    required this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height,
      padding: padding ?? EdgeInsets.zero,
      alignment: alignment ?? Alignment.topLeft,
      child: child,
    );
  }
}
