import 'package:flutter/material.dart';
import 'pulsing.dart';
import 'rotate_animated.dart';

class Aaniamtion extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Aaniamtion> with TickerProviderStateMixin {
  // late AnimationController motionController;
  // late Animation motionAnimation;
  double size = 20;
  // late Duration duration;
  // late Tween<double> tween;
  Duration _duration = Duration(hours: 10);
  // Tween<double> _tween = Tween(begin: 1.0, end: 1.0);
  void initState() {
    super.initState();
    // RotatingAnimationWidget.duration = Duration(seconds: 10);
    RotatingAnimationWidget.animationController =
        AnimationController(vsync: this, duration: _duration);
    // motionController = AnimationController(
    //   duration: Duration(seconds: 1),
    //   vsync: this,
    //   lowerBound: 0.5,
    // );

    // motionAnimation = CurvedAnimation(
    //   parent: motionController,
    //   curve: Curves.ease,
    // );

    // motionController.forward();
    // motionController.addStatusListener((status) {
    //   setState(() {
    //     if (status == AnimationStatus.completed) {
    //       motionController.reverse();
    //     } else if (status == AnimationStatus.dismissed) {
    //       motionController.forward();
    //     }
    //   });
    // });

    // motionController.addListener(() {
    //   setState(() {
    //     size = motionController.value * 250;
    //   });
    // });
    // motionController.repeat();
  }

  // @override
  // void dispose() {
  //   motionController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // print('duration 1 = $x');
    // tween = Tween(begin: 0.5, end: 1.0);
    // duration = Duration(milliseconds: 2000);

    // print('duration 1 = $_duration');
    return Scaffold(
      appBar: AppBar(
        //A bonus For you
        centerTitle: true,
        // title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200, left: 8, right: 8),
        child: Column(
          children: <Widget>[
            Center(
              child: Center(
                child: RotatingAnimationWidget(
                  GestureDetector(
                    child: Icon(
                      Icons.place,
                      color: Colors.black,
                      size: 60,
                    ),
                    onHorizontalDragEnd: (dragDownDetails) {
                      setState(
                        () {
                          _duration = Duration(seconds: 150);
                          RotatingAnimationWidget.animationController =
                              AnimationController(
                                  vsync: this,
                                  duration: Duration(milliseconds: 500))
                                ..forward();
                        },
                      );
                    },
                  ),
                  // duration: duration,
                  // tween: tween,
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
