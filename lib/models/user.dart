class User {
  final String id;
  final String email;
  final String phone;
  final String password;

  User(
    this.email,
    this.phone,
    this.password,{
      String id,
  })  : this.id = id ?? null;

  @override
  int get hashCode =>
      id.hashCode ^ email.hashCode ^ phone.hashCode ;

  Map<String, Object> toJson() {
    return {
      "password": password,
      "phone": phone,
      "email": email,
      "id": id,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, phone: $phone}';
  }

  static User fromJson(Map<String, Object> json) {
    return User(
      json["id"] as String,
      json["phone"] as String,
      json["email"] as String,
    );
  }
}