import 'package:federicoviceconti_github_io/core/full_screen_widget.dart';
import 'package:federicoviceconti_github_io/home_page/widget/shape_background_widget.dart';
import 'package:federicoviceconti_github_io/utility/coordinate_helper.dart';
import 'package:flutter/material.dart';

class HomePageBackgroundWidget extends StatelessWidget {
  final bool isDefaultPosition;
  final double localX;
  final double localY;

  HomePageBackgroundWidget({
    this.localX = 0.0,
    this.localY = 0.0,
    this.isDefaultPosition = true,
  });

  @override
  Widget build(BuildContext context) {
    return _buildTransform(context);
  }

  _buildTransform(BuildContext context) {
    final shapeBackgroundChild = FullScreenWidget(
      child: ShapeBackgroundWidget(
        movingShape: true,
        coordinates: CoordinateHelper.getCoordinates(context),
      ),
    );

    return shapeBackgroundChild;
  }
}
