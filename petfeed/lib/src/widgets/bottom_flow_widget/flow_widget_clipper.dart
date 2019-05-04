import 'package:flutter/material.dart';

class FlowWidgetClipper extends CustomClipper<Path> {
  final Offset offset;

  FlowWidgetClipper({@required this.offset});

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0, 30);
    path.quadraticBezierTo(
        50 - offset.dx, 60 - offset.dy, 100 - offset.dx, 30 - offset.dy);
    path.quadraticBezierTo(
        150 - offset.dx, 00 - offset.dy, 200 - offset.dx, 30 - offset.dy);
    path.quadraticBezierTo(
        250 - offset.dx, 60 - offset.dy, 300 - offset.dx, 30 - offset.dy);
    path.quadraticBezierTo(
        350 - offset.dx, 00 - offset.dy, 400 - offset.dx, 30 - offset.dy);
    path.quadraticBezierTo(
        450 - offset.dx, 60 - offset.dy, 500 - offset.dx, 30 - offset.dy);
    path.quadraticBezierTo(
        550 - offset.dx, 00 - offset.dy, 600 - offset.dx, 30 - offset.dy);
    path.quadraticBezierTo(
        650 - offset.dx, 60 - offset.dy, 700 - offset.dx, 30 - offset.dy);
    path.quadraticBezierTo(
        750 - offset.dx, 00 - offset.dy, 800 - offset.dx, 30 - offset.dy);
    path.quadraticBezierTo(
        850 - offset.dx, 60 - offset.dy, 900 - offset.dx, 30 - offset.dy);
    path.quadraticBezierTo(
        950 - offset.dx, 00 - offset.dy, 1000 - offset.dx, 30 - offset.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.width);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
