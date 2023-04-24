class Usuario {
  final int cc;
  final String name;
  final String pass;
  final String userType;
  final String createdAt;
  final String updatedAt;

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
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cc': cc,
      'name': name,
      'pass': pass,
      'userType': userType,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
