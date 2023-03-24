// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:w1/constant/colorsize.dart';

class HoverIcon extends StatefulWidget {
  const HoverIcon({
    Key? key,
    required this.icon,
    required this.pressed,
  }) : super(key: key);
  final Icon icon;
  final void Function() pressed;

  @override
  State<HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
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
        child: IconButton(
          onPressed: widget.pressed,
          icon: widget.icon,
          color: _isHover ? purpleC : darkC,
        ));
  }
}
