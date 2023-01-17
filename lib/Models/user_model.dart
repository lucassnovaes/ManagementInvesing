class UserModel {
  int? id = 0;
  String? name = "";
  String? email = "";
  String? user = "";
  String? password = "";

  UserModel({
    this.id,
    this.name,
    this.email,
    this.user,
    this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'user': user,
      'email': email,
      'password': password
    };
  }
}
