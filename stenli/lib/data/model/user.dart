class User {
  User({
    this.idUser,
    this.nama,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
  });

  String? idUser;
  String? nama;
  String? email;
  String? password;
  String? createdAt;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idUser: json["id_user"],
        nama: json["nama"],
        email: json["email"],
        password: json["password"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "nama": nama,
        "email": email,
        "password": password,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
