class UserModel {
  String email;
  String icon;
  int id;
  String username;
  String password;

  UserModel.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        icon = json['icon'],
        id = json['id'],
        username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'email': email,
        'icon': icon,
        'id': id,
        'username': username,
        'password': password,
      };

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write("\"email\":\"$email\"");
    sb.write(",\"icon\":\"$icon\"");
    sb.write(",\"id\":$id");
    sb.write(",\"username\":\"$username\"");
    sb.write(",\"password\":\"$password\"");
    sb.write('}');
    return sb.toString();
  }
}

