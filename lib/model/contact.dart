// ignore_for_file: camel_case_types

import 'dart:convert';

lContact lContactFromMap(String str) => lContact.fromMap(json.decode(str));

String lContactToMap(lContact data) => json.encode(data.toMap());

class lContact {
  lContact({
    this.id,
    required this.resume,
    required this.email,
  });

  String? id;
  final String resume;
  final String email;

  factory lContact.fromMap(Map<String, dynamic> json) => lContact(
        id: json["id"],
        resume: json["resume"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "resume": resume,
        "email": email,
      };

  toJson() {}
}
