// ignore_for_file: depend_on_referenced_packages, file_names

Account accountFromJson(
        Map<String, dynamic> json, String password, String token) =>
    Account.fromJson(json, password, token);

class Account {
  final String id;
  final String address;
  final String password;
  int quota;
  int used;
  bool isDisabled;
  bool isDeleted;
  final String token;
  final DateTime createdAt;
  DateTime updatedAt;

  Account({
    required this.id,
    required this.address,
    required this.password,
    required this.quota,
    required this.used,
    required this.isDisabled,
    required this.isDeleted,
    required this.token,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Account.fromJson(Map<String, dynamic> json, String password,
          [String? token]) =>
      Account(
        id: json['id'],
        address: json['address'],
        password: password,
        quota: json['quota'],
        used: json['used'],
        isDisabled: json['isDisabled'],
        isDeleted: json['isDeleted'],
        token: token!,
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        // mercure: Mercure(
        //   url: 'https://mercure.mail.tm/.well-known/mercure',
        //   topics: ["/accounts/${json['id']}"],
        //   token: token,
        // ),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'address': address,
        'password': password,
        'quota': quota,
        'used': used,
        'isDisabled': isDisabled,
        'isDeleted': isDeleted,
        'token': token,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  @override
  operator ==(Object other) =>
      identical(this, other) || other is Account && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => address;
}
