import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CursorWidget extends StatelessWidget {
  final Widget child;

  const CursorWidget({
    Key key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: child,
    );
  }
}
