// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ZoomIcon extends StatefulWidget {
  const ZoomIcon({
    Key? key,
    required this.icon,
    required this.pressed,
  }) : super(key: key);
  final Icon icon;
  final void Function() pressed;

  @override
  State<ZoomIcon> createState() => _ZoomIconState();
}

class _ZoomIconState extends State<ZoomIcon> {
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
          color: Colors.white,
          iconSize: _isHover ? 25 : 20,
        ));
  }
}
