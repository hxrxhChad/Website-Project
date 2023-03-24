// ignore_for_file: camel_case_types

import 'dart:convert';

lHome lHomeFromMap(String str) => lHome.fromMap(json.decode(str));

String lHomeToMap(lHome data) => json.encode(data.toMap());

class lHome {
  lHome({
    this.id,
    required this.name,
    required this.bio,
    required this.slogan,
    required this.github,
    required this.instagram,
    required this.linkedin,
    required this.dp,
    required this.skill1,
    required this.skill2,
    required this.skill3,
    required this.skill4,
    required this.skill5,
    required this.skill6,
  });

  String? id;
  final String name;
  final String bio;
  final String slogan;
  final String github;
  final String instagram;
  final String linkedin;
  final String dp;
  final String skill1;
  final String skill2;
  final String skill3;
  final String skill4;
  final String skill5;
  final String skill6;

  factory lHome.fromMap(Map<String, dynamic> json) => lHome(
        id: json["id"],
        name: json["name"],
        bio: json["bio"],
        slogan: json["slogan"],
        github: json["github"],
        instagram: json["instagram"],
        linkedin: json["linkedin"],
        dp: json["dp"],
        skill1: json["skill1"],
        skill2: json["skill2"],
        skill3: json["skill3"],
        skill4: json["skill4"],
        skill5: json["skill5"],
        skill6: json["skill6"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "bio": bio,
        "slogan": slogan,
        "github": github,
        "instagram": instagram,
        "linkedin": linkedin,
        "dp": dp,
        "skill1": skill1,
        "skill2": skill2,
        "skill3": skill3,
        "skill4": skill4,
        "skill5": skill5,
        "skill6": skill6,
      };
}
