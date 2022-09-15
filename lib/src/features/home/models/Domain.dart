// To parse this JSON data, do
//
//     final domain = domainFromJson(jsonString);

import 'dart:convert';

List<Domain> domainFromJson(List data) =>
    List<Domain>.from(data.map((x) => Domain.fromJson(x)));

String domainToJson(List<Domain> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Domain {
  Domain({
    required this.id,
    required this.domain,
    required this.isActive,
    required this.isPrivate,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String domain;
  bool isActive;
  bool isPrivate;
  DateTime createdAt;
  DateTime updatedAt;

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
        id: json["id"],
        domain: json["domain"],
        isActive: json["isActive"],
        isPrivate: json["isPrivate"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "domain": domain,
        "isActive": isActive,
        "isPrivate": isPrivate,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}
