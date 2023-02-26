import 'dart:async';
import 'dart:math';

import 'package:dark_and_light_mode_module/widget/custom_analog_clock.dart';
import 'package:flutter/material.dart';

class ClockBase extends StatefulWidget {
  final double size;
  const ClockBase({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  State<ClockBase> createState() => _ClockBaseState();
}

class _ClockBaseState extends State<ClockBase> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        value = 0.0167 * DateTime.now().second;
      });
    });
    super.initState();
  }

  double value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 2,
      child: SizedBox(
        height: widget.size,
        width: widget.size,
        child: Stack(
          children: [
            ShaderMask(
              shaderCallback: (rect) {
                return SweepGradient(
                    startAngle: 0,
                    endAngle: 2 * pi,
                    stops: [value, value],
                    center: Alignment.center,
                    colors: [
                      Theme.of(context).canvasColor,
                      Theme.of(context).textTheme.bodyLarge!.color!
                    ]).createShader(rect);
              },
              child: Container(
                height: widget.size,
                width: widget.size,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: Image.asset(
                    'assets/clockDial.png',
                    fit: BoxFit.fill,
                  ).image),
                ),
              ),
            ),
            Center(
              child: Container(
                height: 125,
                width: 125,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: BoxShape.circle),
                child:
                    Transform.scale(scale: 0.7, child: const ClockForeGround()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
