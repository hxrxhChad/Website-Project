// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:w1/constant/colorsize.dart';

class LinkText extends StatefulWidget {
  const LinkText({
    Key? key,
    required this.title,
    required this.pressed,
  }) : super(key: key);

  final String title;
  final void Function() pressed;

  @override
  State<LinkText> createState() => _LinkTextState();
}

class _LinkTextState extends State<LinkText> {
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
              color: _isHover ? purpleC : darkC.withOpacity(0.6)),
        ),
      ),
    );
  }
}
