class User {
  int id;
  String name;
  String email;
  DateTime? emailVerifiedAt;
  String password;
  String? rememberToken;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.password,
    this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });
  User.empty()
      : id = 0,
        name = '',
        email = '',
        emailVerifiedAt = null,
        password = '',
        rememberToken = null,
        createdAt = DateTime.now(),
        updatedAt = DateTime.now();
  

  // Méthode pour créer un objet User à partir d'un JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'] != null
          ? DateTime.parse(json['email_verified_at'])
          : null,
      password: json['password'],
      rememberToken: json['remember_token'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  // Méthode pour convertir un objet User en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'password': password,
      'remember_token': rememberToken,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
