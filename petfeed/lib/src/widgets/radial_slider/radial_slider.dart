import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petfeed/src/assets/assets.dart';
import 'package:petfeed/src/widgets/radial_slider/base_painter.dart';
import 'package:petfeed/src/widgets/radial_slider/radial_utils.dart';
import 'package:petfeed/src/widgets/radial_slider/slider_painter.dart';

class RadialSlider extends StatefulWidget {
  final Widget child;
  final double minFood;
  final double maxFood;

  /// initial percentage of radial slider to be set to
  final double init;
  final Function onChange;

  const RadialSlider({
    Key key,
    this.child,
    this.init = 50,
    @required this.onChange,
    this.minFood = 0.5,
    this.maxFood = 50,
  }) : super(key: key);

  @override
  _RadialSliderState createState() => _RadialSliderState();
}

class _RadialSliderState extends State<RadialSlider> {
  final maxPan = 1.6;
  final minPan = -1.6;
  final zeroOffset = 0.001;
  final sweepOffset = 1.6;
  double start;
  double sweep;
  SliderPainter _sliderPainter;
  bool _isHandleSelected = false;

  @override
  void initState() {
    start = _mapPercentToValue(-sweepOffset, sweepOffset, widget.init);
    start = start == 0 ? zeroOffset : start;
    sweep = start + sweepOffset;
    sweep = start + sweepOffset;
    _sliderPainter = SliderPainter(
      startAngle: start,
      selectionColor: Colors.green,
      sweepAngle: -sweep,
      handleColor: Colors.black12,
      handleFillColor: Colors.white,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(
      width: ScreenSize.screenWidth,
      height: ScreenSize.screenHeight,
      allowFontScaling: true,
    )..init(context);

    return Container(
      width: 100,
      height: 100,
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setHeight(10),
        horizontal: ScreenUtil().setWidth(10),
      ),
      child: GestureDetector(
        onPanDown: _onPanDown,
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: CustomPaint(
          painter: BasePainter(baseColor: Colors.black12),
          foregroundPainter: _sliderPainter,
          child: widget.child,
        ),
      ),
    );
  }

  _onPanDown(DragDownDetails details) {
    if (_sliderPainter == null) return;
    RenderBox renderBox = context.findRenderObject();
    var position = renderBox.globalToLocal(details.globalPosition);
    if (position != null) {
      _isHandleSelected =
          isPointInsideCircle(position, _sliderPainter.initHandler, 100.0);
    }
  }

  _onPanUpdate(DragUpdateDetails details) {
    if (!_isHandleSelected) return;
    if (_sliderPainter.center == null) return;

    RenderBox renderBox = context.findRenderObject();
    var position = renderBox.globalToLocal(details.globalPosition);
    var angle = 3 - coordinatesToRadians(_sliderPainter.center, position);

    if (angle >= 3 && angle < 4.5) {
      angle = 3;
    } else if (angle <= 0) {
      angle = 0;
    } else if (angle >= 4.5) {
      angle = 0;
    }
    var newValue = _mapValueToPercent(0, 3, angle);

    if (_isHandleSelected) {
      _calculatePaintData(newValue);
      var treatAmount =
          _mapPercentToValue(widget.minFood, widget.maxFood, newValue);
      widget.onChange(treatAmount);
    }
  }

  _onPanEnd(DragEndDetails details) {
    _isHandleSelected = false;
  }

  @override
  void didUpdateWidget(RadialSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.init != widget.init) {
      _calculatePaintData(_mapValueToPercent(-sweepOffset, sweepOffset, start));
    }
  }

  double _mapValueToPercent(double min, double max, double value) {
    return ((value - min) * 100) / (max - min);
  }

  double _mapPercentToValue(double min, double max, double percent) {
    return ((percent * (max - min)) / 100 + min);
  }

  void _calculatePaintData(double percent) {
    start = _mapPercentToValue(-sweepOffset, sweepOffset, percent);
    start = start == 0 ? zeroOffset : start;
    sweep = start + sweepOffset;

    _sliderPainter.startAngle = start;
    _sliderPainter.sweepAngle = -sweep;
  }
}
