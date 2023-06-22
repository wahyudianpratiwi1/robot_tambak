class User {
  String? id;
  String? namaLengkap;
  String? email;
  String? password;
  String? confirmPassword;

  User({
    this.id,
    this.namaLengkap,
    this.email,
    this.password,
    this.confirmPassword,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        namaLengkap: json["nama_lengkap"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirm_password"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_lengkap": namaLengkap,
        "email": email,
        "password": password,
        "confirm_password": confirmPassword,
      };
}
