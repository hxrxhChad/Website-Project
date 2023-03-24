// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:w1/constant/colorsize.dart';

class SkillIcon extends StatelessWidget {
  const SkillIcon({
    Key? key,
    required this.skillImage,
  }) : super(key: key);

  final String skillImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          //
        },
        child: Material(
          color: Colors.white,
          elevation: 15,
          shadowColor: darkC.withOpacity(0.1),
          shape: const CircleBorder(),
          child: Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: DecorationImage(image: NetworkImage(skillImage))),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
