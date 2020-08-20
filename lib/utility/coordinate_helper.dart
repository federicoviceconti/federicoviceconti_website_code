import 'package:federicoviceconti_github_io/utility/proportion.dart';
import 'package:flutter/material.dart';

class CoordinateHelper {
  static List<List<double>> getCoordinates(BuildContext context) {
    return [
      [
        Proportion.getProportionalWidth(context, 100),
        Proportion.getProportionalHeight(context, 100)
      ],
      [
        Proportion.getProportionalWidth(context, 200),
        Proportion.getProportionalHeight(context, 800)
      ],
      [
        Proportion.getProportionalWidth(context, 300),
        Proportion.getProportionalHeight(context, 200)
      ],
      [
        Proportion.getProportionalWidth(context, 400),
        Proportion.getProportionalHeight(context, 650)
      ],
      [
        Proportion.getProportionalWidth(context, 600),
        Proportion.getProportionalHeight(context, 750)
      ],
      [
        Proportion.getProportionalWidth(context, 700),
        Proportion.getProportionalHeight(context, 200)
      ],
      [
        Proportion.getProportionalWidth(context, 900),
        Proportion.getProportionalHeight(context, 850)
      ]
    ];
  }
}