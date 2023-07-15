import 'dart:convert';

class ModelUser {
  String? id;
  String name;
  String email;
  String role;
  bool is_admin;
  String phone;
  ModelUser({
    this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.is_admin,
    required this.phone,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'is_admin': is_admin,
      'phone': phone,
    };
  }

  factory ModelUser.fromMap(Map<String, dynamic> map) {
    return ModelUser(
      id: map['id'],
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      role: map['role'] ?? '',
      is_admin: map['is_admin'] ?? false,
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelUser.fromJson(String source) => ModelUser.fromMap(json.decode(source));
}
