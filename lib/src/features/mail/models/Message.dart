// ignore_for_file: file_names

import 'package:mailtemp/src/features/mail/models/Attachment.dart';

List<Message> messageFromJsonList(List data) =>
    List<Message>.from(data.map((x) => Message.fromMap(x)));

Message messageFromJson(Map<String, dynamic> json) => Message.fromMap(json);

class Message {
  Message({
    required this.id,
    required this.accountId,
    this.msgid,
    this.intro,
    required this.from,
    required this.to,
    this.cc,
    this.bcc,
    required this.subject,
    this.seen,
    this.flagged,
    this.isDeleted,
    this.verifications,
    this.retention,
    this.retentionDate,
    this.text,
    this.html,
    this.hasAttachments,
    this.attachments,
    this.size,
    this.url,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final String accountId;
  final String? msgid;
  final String? intro;
  final Map<String, dynamic>? from;
  final List<Map<String, dynamic>>? to;
  final List<String>? cc;
  final List<String>? bcc;
  final String? subject;
  final bool? seen;
  final bool? flagged;
  final bool? isDeleted;
  final List<String>? verifications;
  final bool? retention;
  final DateTime? retentionDate;
  final String? text;
  final List<String>? html;
  final bool? hasAttachments;

  final List<Attachment>? attachments;

  final int? size;

  final String? url;

  final DateTime? createdAt;

  final DateTime? updatedAt;

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        id: json["id"],
        accountId: json["accountId"].split('/accounts/')[1],
        msgid: json["msgid"],
        intro: json["intro"],
        from: json["from"],
        to: json["to"] == null
            ? []
            : List<Map<String, dynamic>>.from(json["to"]),
        cc: json["cc"] == null ? [] : List<String>.from(json["cc"]),
        bcc: json["bcc"] == null ? [] : List<String>.from(json["bcc"]),
        subject: json["subject"],
        seen: json["seen"],
        flagged: json["flagged"] ?? false,
        isDeleted: json["isDeleted"],
        verifications: json["verifications"] == null
            ? []
            : List<String>.from(json["verifications"]),
        retention: json["retention"] ?? false,
        retentionDate: json["retentionDate"] == null
            ? null
            : DateTime.parse(json["retentionDate"]),
        text: json["text"],
        html: json["html"] == null ? [] : List<String>.from(json["html"]),
        hasAttachments: json["hasAttachments"],
        attachments: json["attachments"] == null
            ? []
            : json["attachments"]
                .map<Attachment>((e) => attachmentFromJson(
                      e,
                      json["accountId"].split('/accounts/')[1],
                    ))
                .toList(),
        size: json["size"],
        url: json["downloadUrl"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  /// Returns the message as a map.
  Map<String, dynamic> toJson() => {
        "id": id,
        "accountId": accountId,
        "msgid": msgid,
        "intro": intro,
        "from": from,
        "to": to,
        "cc": cc,
        "bcc": bcc,
        "subject": subject,
        "seen": seen,
        "flagged": flagged,
        "isDeleted": isDeleted,
        "verifications": verifications,
        "retention": retention,
        "retentionDate": retentionDate!.toIso8601String(),
        "text": text,
        "html": html,
        "hasAttachments": hasAttachments,
        "attachments": attachments,
        "size": size,
        "url": url,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
