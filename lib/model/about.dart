// ignore_for_file: camel_case_types

import 'dart:convert';

lAbout lAboutFromMap(String str) => lAbout.fromMap(json.decode(str));

String lAboutToMap(lAbout data) => json.encode(data.toMap());

class lAbout {
  lAbout({
    this.id,
    required this.slogan,
    required this.about,
    required this.rotateText,
    required this.bannerUrl,
  });

  String? id;
  final String slogan;
  final String about;
  final String rotateText;
  final String bannerUrl;

  factory lAbout.fromMap(Map<String, dynamic> json) => lAbout(
        id: json["id"],
        slogan: json["slogan"],
        about: json["about"],
        rotateText: json["rotateText"],
        bannerUrl: json["bannerUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "slogan": slogan,
        "about": about,
        "rotateText": rotateText,
        "bannerUrl": bannerUrl,
      };
}
