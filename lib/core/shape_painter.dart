import 'package:flutter/material.dart';

class ShapePainter extends CustomPainter {
  final Paint painter;
  final ShapePainterType shapeType;

  ShapePainter(
      {Color color = Colors.white,
      PaintingStyle style = PaintingStyle.fill,
      this.shapeType = ShapePainterType.square})
      : painter = Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = style;

  @override
  void paint(Canvas canvas, Size size) {
    switch (shapeType) {
      case ShapePainterType.triangle:
        _drawTriangle(canvas, size);
        break;
      case ShapePainterType.square:
        _drawSquare(canvas, size);
        break;
      case ShapePainterType.circle:
        _drawCircle(canvas, size);
        break;
      default:
    }
  }

  void _drawTriangle(Canvas canvas, Size size) {
    var path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.height, size.width)
      ..close();

    canvas.drawPath(path, painter);
  }

  void _drawSquare(Canvas canvas, Size size) {
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      painter);
  }

  void _drawCircle(Canvas canvas, Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), (size.width ?? size.height) / 2 , painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

enum ShapePainterType { triangle, circle, square }
