// ignore_for_file: file_names

Attachment attachmentFromJson(Map<String, dynamic> json, String accountId) =>
    Attachment.fromJson(json, accountId);

class Attachment {
  final String id;
  final String name;
  final String type;
  final String disposition;
  final String encoding;
  final bool related;
  final int size;
  final String url;
  final String accountId;

  const Attachment({
    required this.id,
    required this.name,
    required this.type,
    required this.disposition,
    required this.encoding,
    required this.related,
    required this.size,
    required this.url,
    required this.accountId,
  });

  factory Attachment.fromJson(Map<String, dynamic> json, String accountId) =>
      Attachment(
        id: json['id'],
        name: json['filename'],
        type: json['contentType'],
        disposition: json['disposition'],
        encoding: json['transferEncoding'],
        related: json['related'],
        size: json['size'],
        url: json['downloadUrl'],
        accountId: accountId,
      );
}
