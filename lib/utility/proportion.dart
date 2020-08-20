import 'package:flutter/material.dart';

class Proportion {
  static double getProportionalWidth(BuildContext context, double value) {
    return value * MediaQuery.of(context).size.width / 1000;
  }

  static double getProportionalHeight(BuildContext context, double value) {
    return value * MediaQuery.of(context).size.height / 1000;
  }

  static double getProportionalValueOnLongSize(BuildContext context, double value) {
    final screenSize = MediaQuery.of(context).size;
    return screenSize.height > screenSize.width 
      ? getProportionalHeight(context, value)
      : getProportionalWidth(context, value);
  }
}