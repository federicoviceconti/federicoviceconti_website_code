import 'package:flutter/material.dart';

class AnimationHelper {
  static Widget buildOpacityChild(bool condition,
      {bool hasAnimation = true, Widget child}) {
    return hasAnimation
        ? AnimatedOpacity(
            opacity: condition ? 1 : 0,
            duration: Duration(
              milliseconds: 500,
            ),
            child: child,
          )
        : Opacity(
            opacity: condition ? 1 : 0,
            child: child,
          );
  }

  static Widget buildSwitcher(bool condition,
      {@required Widget childOnTrue, @required Widget childOnFalse}) {
    return AnimatedSwitcher(
      duration: Duration(
        milliseconds: 500,
      ),
      child: condition ? childOnTrue : childOnFalse,
    );
  }
}