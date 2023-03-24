// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:w1/constant/colorsize.dart';

class RotateText extends StatefulWidget {
  const RotateText({
    Key? key,
    required this.rotateText,
  }) : super(key: key);
  final String rotateText;
  @override
  State<RotateText> createState() => _RotateTextState();
}

class _RotateTextState extends State<RotateText> with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 15));

    animation = CurvedAnimation(parent: controller!, curve: Curves.bounceIn);
    controller!.repeat();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation!,
      child: CircularText(children: [
        TextItem(
            text: Text(
              widget.rotateText,
              style: const TextStyle(
                color: darkC,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            space: 15),
      ]),
    );
  }
}
