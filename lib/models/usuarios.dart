class Usuario {
  final int cc;
  final String name;
  final String pass;
  final String userType;
  final DateTime createdAt;
  final DateTime updatedAt;

  Usuario({
    required this.cc,
    required this.name,
    required this.pass,
    required this.userType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      cc: json['cc'],
      name: json['name'],
      pass: json['pass'],
      userType: json['userType'],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cc': cc,
      'name': name,
      'pass': pass,
      'userType': userType,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
