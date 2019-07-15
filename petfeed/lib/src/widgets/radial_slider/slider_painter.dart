import 'dart:math';

import 'package:flutter/material.dart';
import 'package:petfeed/src/widgets/radial_slider/radial_utils.dart';

class SliderPainter extends CustomPainter {
  double startAngle;
  double sweepAngle;
  final Color selectionColor;
  final Color handleColor;
  final Color handleFillColor;

  Offset initHandler;
  Offset center;
  double radius;

  SliderPainter({
    @required this.handleColor,
    @required this.handleFillColor,
    @required this.startAngle,
    @required this.sweepAngle,
    @required this.selectionColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (startAngle == 0.0) return;

    Paint progress = _getPaint(color: selectionColor);

    center = Offset(size.width / 2, size.height / 2);
    radius = min(size.width / 2, size.height / 2);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        -pi / 2 + startAngle, sweepAngle, false, progress);

    Paint handler =
        _getPaint(color: handleFillColor, style: PaintingStyle.fill);
    Paint handlerOutter = _getPaint(color: handleColor, width: 2.0);

    // draw handlers
    initHandler = radiansToCoordinates(center, -pi / 2 + startAngle, radius);
    canvas.drawCircle(initHandler, 11.0, handler);
    canvas.drawCircle(initHandler, 12.0, handlerOutter);
  }

  Paint _getPaint({@required Color color, double width, PaintingStyle style}) =>
      Paint()
        ..color = color
        ..strokeCap = StrokeCap.round
        ..style = style ?? PaintingStyle.stroke
        ..strokeWidth = width ?? 12.0;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
