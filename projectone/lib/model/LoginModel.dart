class LoginModel {
  String backGround;
  String title;
  String subtitle;

  LoginModel(
      {this.backGround,
      this.title,
      this.subtitle,});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      backGround: json['backGround'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}
