class LoginModel {
  int uid;
  String name;
  String phone;
  String email;
  int age;
  int sex;

  LoginModel({
    this.uid,
    this.name,
    this.phone,
    this.email,
    this.age,
    this.sex,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      uid: json['uid'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      age: json['age'],
      sex: json['sex'],
    );
  }
}
