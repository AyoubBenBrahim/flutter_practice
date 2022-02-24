/// Continuous rotattion of a widget
/// [widget] - Widget to rotate {required}
/// [duration] - Duration of the rotation (default [Duration(seconds:15)])
import 'package:flutter/material.dart';

class RotatingAnimationWidget extends StatefulWidget {
  final Widget rotatingWidget;
  // static late Duration duration;
  static late AnimationController animationController;
  const RotatingAnimationWidget(this.rotatingWidget);
  _RotatingAnimationWidget createState() => _RotatingAnimationWidget();
}

class _RotatingAnimationWidget extends State<RotatingAnimationWidget>
    with SingleTickerProviderStateMixin {
  // late Duration _duration;

  @override
  void initState() {
    super.initState();
    // _duration = RotatingAnimationWidget.duration;
    // RotatingAnimationWidget.animationController =
    //     AnimationController(vsync: this, duration: _duration)..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      alignment: Alignment.center,
      turns: RotatingAnimationWidget.animationController,
      child: widget.rotatingWidget,
    );
  }

  @override
  void dispose() {
    RotatingAnimationWidget.animationController.dispose();
    super.dispose();
  }
}
