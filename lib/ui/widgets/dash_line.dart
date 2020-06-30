import 'package:flutter/material.dart';

class GLDashLine extends StatelessWidget {
  final Axis axis;
  final double dashWidth;
  final double dashHeight;
  final int count;
  final Color color;

  GLDashLine({
    this.axis = Axis.horizontal,
    this.dashWidth = 1,
    this.dashHeight = 1,
    this.color = Colors.grey,
    this.count = 10
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (_) {
        return SizedBox(
          width: dashWidth,
          height: dashHeight,
          child: DecoratedBox(decoration: BoxDecoration(color: color)),
        );
      }),
    );
  }
}