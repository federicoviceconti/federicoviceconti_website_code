import 'dart:async';
import 'dart:math';

import 'package:federicoviceconti_github_io/core/shape_painter.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShapeBackgroundWidget extends StatelessWidget {
  final List<List<double>> coordinates;
  final bool movingShape;

  ShapeBackgroundWidget({
    Key key,
    this.coordinates,
    this.movingShape,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _positionTriangleWithCoordinates(coordinates, MediaQuery.of(context).size),
    );
  }

  List<Widget> _positionTriangleWithCoordinates(
      List<List<double>> coordinates, Size screenSize) {
    return Iterable<int>.generate(coordinates.length).toList().map((index) {
      final x = coordinates[index][0];
      final y = coordinates[index][1];
      
      final deltaTimeMillis = _getDeltaTimeMillis();
      return ShapePositionedWidget(
        moveShape: movingShape,
        x: x,
        y: y,
        radius: _getRadius(screenSize),
        deltaTimeMillis: deltaTimeMillis,
        deltaTheta: 0.004,
        shapeType: _getShapeType(index),
        shapeStyle: index % 3 == 0 ? PaintingStyle.stroke : PaintingStyle.fill,
      );
    }).toList();
  }

  int _getRadius(Size screenSize) {
    final minRadius = screenSize.width ~/ 10;
    final maxRadius = screenSize.width.toInt();
    return minRadius + Random().nextInt(maxRadius - minRadius);
  }

  int _getDeltaTimeMillis() {
    final minDeltaMillis = 80;
    final maxDeltaMillis = 100;
    return minDeltaMillis + Random().nextInt(maxDeltaMillis - minDeltaMillis);
  }

  ShapePainterType _getShapeType(int index) {
    if (index % 2 == 0) {
      return ShapePainterType.square;
    } else if (index % 3 == 0) {
      return ShapePainterType.circle;
    }

    return ShapePainterType.triangle;
  }
}

/// For getting point we will use the following function:
/// x = r cos(t)
/// y = r sin(t)
///
/// where r is the radius and t the theta
class ShapePositionedWidget extends StatefulWidget {
  final double x;
  final double y;
  final int radius;
  final double deltaTheta;
  final int deltaTimeMillis;
  final ShapePainterType shapeType;
  final PaintingStyle shapeStyle;
  final bool moveShape;

  const ShapePositionedWidget({
    Key key,
    this.x,
    this.y,
    this.radius,
    this.deltaTheta,
    this.shapeType,
    this.shapeStyle,
    this.deltaTimeMillis, 
    this.moveShape,
  }) : super(key: key);

  @override
  _ShapePositionedWidgetState createState() => _ShapePositionedWidgetState();
}

class _ShapePositionedWidgetState extends State<ShapePositionedWidget> {
  double theta = 0;

  @override
  Widget build(BuildContext context) {
    final x = widget.moveShape ? widget.x + (widget.radius * cos(theta)) : widget.x;
    final y = widget.moveShape ? widget.y + (widget.radius * sin(theta)) : widget.y;
    return Positioned(
      left: x,
      top: y,
      child: Stack(
        children: [
          widget.moveShape ? Container() : _buildShadowShape(x, y),
          CustomPaint(
            painter: ShapePainter(
                shapeType: widget.shapeType,
                color: Colors.grey,
                style: widget.shapeStyle),
            size: Size(
              10,
              10,
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    if(widget.moveShape) {
      Timer.periodic(Duration(milliseconds: widget.deltaTimeMillis), (timer) {
        if(mounted) {
          setState(() {
            theta = theta + widget?.deltaTheta ?? 0.0;
          });
        } else {
          timer.cancel();
        }
      });
    }

    super.initState();
  }

  Widget _buildShadowShape(double x, double y) {
    return Consumer<AppThemeNotifier>(
      builder: (context, appThemeNotifier, child) {
        return appThemeNotifier.currentAppTheme == ThemeMode.dark
            ? Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      blurRadius: 16.0,
                      color: Colors.white.withOpacity(0.3),
                      spreadRadius: 4.0)
                ]),
              )
            : Container();
      },
    );
  }
}
