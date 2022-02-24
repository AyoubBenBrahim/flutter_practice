import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PathExample(),
      ),
    );

class PathExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PathPainter(),
    );
  }
}

class PathPainter extends CustomPainter {
@override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0;

    Path path = Path();
    path.moveTo(0, size.height / 2);
    path.quadraticBezierTo(size.width / 2, (size.height/4) - 20, size.width, size.height / 2);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}