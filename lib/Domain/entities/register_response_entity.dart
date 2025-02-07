class RegisterResponseEntity {
  RegisterResponseEntity({this.message, this.user, this.token, this.statusMsg});

  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;
}

class UserEntity {
  UserEntity({
    this.name,
    this.email,
    this.role,
  });

  String? name;
  String? email;
  String? role;
}
