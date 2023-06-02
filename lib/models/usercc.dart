class UserCC {
  final String cc;

  UserCC({required this.cc});

  Map<String, dynamic> toJson() => {'cc': cc};

  factory UserCC.fromJson(Map<String, dynamic> json) => UserCC(
        cc: json['cc'],
      );
}
