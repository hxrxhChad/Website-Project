// ignore_for_file: camel_case_types

import 'dart:convert';

lProject lProjectFromMap(String str) => lProject.fromMap(json.decode(str));

String lProjectToMap(lProject data) => json.encode(data.toMap());

class lProject {
  lProject({
    this.id,
    required this.name,
    required this.detail,
    required this.tech1,
    required this.tech2,
    required this.github,
    required this.web,
    required this.imageUrl,
  });

  String? id;
  final String name;
  final String detail;
  final String tech1;
  final String tech2;
  final String github;
  final String web;
  final String imageUrl;

  factory lProject.fromMap(Map<String, dynamic> json) => lProject(
        id: json["id"],
        name: json["name"],
        detail: json["detail"],
        tech1: json["tech1"],
        tech2: json["tech2"],
        github: json["github"],
        web: json["web"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "detail": detail,
        "tech1": tech1,
        "tech2": tech2,
        "github": github,
        "web": web,
        "imageUrl": imageUrl,
      };
}
