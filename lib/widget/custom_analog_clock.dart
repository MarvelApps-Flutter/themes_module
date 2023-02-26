import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockForeGround extends StatefulWidget {
  const ClockForeGround({Key? key}) : super(key: key);

  @override
  _ClockForeGroundState createState() => _ClockForeGroundState();
}

class _ClockForeGroundState extends State<ClockForeGround> {
  bool disposeCall = false;
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      if (!mounted) return;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: ClockPainter(context),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  final BuildContext context;
  ClockPainter(
    this.context,
  );
  var dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);

    var centerBrush = Paint()
      ..color = Theme.of(context).textTheme.bodyLarge!.color!;

    var minHandBrush = Paint()
      ..color = Theme.of(context).canvasColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var hourHandBrush = Paint()
      ..color = Theme.of(context).canvasColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var hourHandX = centerX +
        64 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        64 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    var minHandX = centerX + 82 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 82 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    canvas.drawCircle(center, 10, centerBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
