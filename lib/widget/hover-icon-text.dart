// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:w1/constant/colorsize.dart';

class HoverIconText extends StatefulWidget {
  const HoverIconText({
    Key? key,
    required this.title,
    required this.icon,
    required this.pressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final void Function() pressed;

  @override
  State<HoverIconText> createState() => _HoverIconTextState();
}

class _HoverIconTextState extends State<HoverIconText> {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
            color: _isHover ? purpleC : darkC,
          ),
          TextButton(
            onPressed: widget.pressed,
            child: Text(
              widget.title,
              style: TextStyle(
                  fontSize: mediumT,
                  fontWeight: FontWeight.w800,
                  color: _isHover ? purpleC : darkC),
            ),
          ),
        ],
      ),
    );
  }
}
