class UserCC {
  final String cc;

  UserCC({required this.cc});

  Map<String, dynamic> toJson() => {'cc': cc};

  factory UserCC.fromJson(String cc) => UserCC(cc: cc);
}
