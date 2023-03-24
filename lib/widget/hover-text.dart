// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:w1/constant/colorsize.dart';

class HoverText extends StatefulWidget {
  const HoverText({
    Key? key,
    required this.title,
    required this.pressed,
  }) : super(key: key);

  final String title;
  final void Function() pressed;

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        setState(() {
          _isHover = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHover = false;
        });
      },
      child: TextButton(
        onPressed: widget.pressed,
        child: Text(
          widget.title,
          style: TextStyle(
              fontSize: mediumT,
              fontWeight: FontWeight.w800,
              color: _isHover ? purpleC : darkC),
        ),
      ),
    );
  }
}
