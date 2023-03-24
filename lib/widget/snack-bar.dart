// ignore_for_file: file_names, deprecated_member_use

import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';

void showSnackBar(context, color, message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            AntIcons.fireFilled,
            color: Colors.white,
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .subtitle2!
                .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    backgroundColor: color,
    duration: const Duration(seconds: 2),
  ));
}
