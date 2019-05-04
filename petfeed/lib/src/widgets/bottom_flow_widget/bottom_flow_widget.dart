import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/bottom_flow_widget/flow_widget_clipper.dart';
import 'package:flutter/animation.dart';

class FlowWidget extends StatefulWidget {
  final double width;
  final double height;

  const FlowWidget(
      {Key key, this.width = ScreenSize.screenWidth, @required this.height})
      : super(key: key);

  @override
  _FlowWidgetState createState() => _FlowWidgetState();
}

class _FlowWidgetState extends State<FlowWidget>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Animation<double> curve;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animation = Tween<double>(begin: 0.0, end: widget.width).animate(curve);

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        if (animation.isCompleted) {
          controller.reverse();
        } else if (animation.isDismissed) {
          controller.forward();
        }

        return Stack(
          children: <Widget>[
            ClipPath(
              clipper: FlowWidgetClipper(
                  offset: Offset(widget.width - animation.value, 0)),
              child: Container(
                width: widget.width,
                height: widget.height,
                color: Colors.black45,
              ),
            ),
            ClipPath(
              clipper: FlowWidgetClipper(offset: Offset(animation.value, 10)),
              child: Container(
                width: widget.width,
                height: widget.height,
                color: Colors.black54,
              ),
            ),
          ],
        );
      },
    );
  }
}
