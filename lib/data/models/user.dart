class LoginUser {
  final String email;
  final String password;

  LoginUser({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> get toJson => {
        'email': email,
        'password': password,
      };
}

class RegistrationUser {
  final String name;
  final String email;
  final String password;
  final String code;

  RegistrationUser({
    required this.name,
    required this.email,
    required this.password,
    required this.code,
  });

  Map<String, dynamic> get toJson => {
        "name": name,
        "email": email,
        "password": password,
        "code": code,
      };
}
