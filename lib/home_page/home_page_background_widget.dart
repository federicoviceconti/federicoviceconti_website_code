import 'package:federicoviceconti_github_io/home_page/parallax_widget.dart';
import 'package:federicoviceconti_github_io/home_page/shape_background_widget.dart';
import 'package:federicoviceconti_github_io/utility/coordinate_helper.dart';
import 'package:federicoviceconti_github_io/utility/html_utility.dart';
import 'package:flutter/material.dart';

class HomePageBackgroundWidget extends StatelessWidget {
  final Size screenSize;
  final bool isDefaultPosition;
  final double localX;
  final double localY;

  HomePageBackgroundWidget(
    this.screenSize, {
    this.localX = 0.0,
    this.localY = 0.0,
    this.isDefaultPosition = true,
  });

  @override
  Widget build(BuildContext context) {
    return _buildTransform(context);
  }

  _buildTransform(BuildContext context) {
    final isMobile = HtmlUtility.isMobile();
    
    final shapeBackgroundChild = Container(
      width: screenSize.width,
      height: screenSize.height,
      child: ShapeBackgroundWidget(
        movingShape: isMobile,
        coordinates: CoordinateHelper.getCoordinates(context),
      ),
    );

    return isMobile ? shapeBackgroundChild : _buildParallax(shapeBackgroundChild);
  }

  _buildParallax(Widget child) {
    return ParallaxWidget(
      isDefaultPosition: isDefaultPosition,
      percentageX: _getPercentageX(screenSize),
      percentageY: _getPercentageY(screenSize),
      rotationOffset: 150,
      child: child,
    );
  }

  double _getPercentageX(Size screenSize) {
    final percentageX = (localX / (screenSize.width)) * 100;
    return percentageX;
  }

  double _getPercentageY(Size screenSize) {
    final percentageY = (localY / screenSize.height) * 100;
    return percentageY;
  }
}
