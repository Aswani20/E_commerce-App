import 'package:e_commerce_app/Domain/entities/register_response_entity.dart';

/// message : "success"
/// user : {"name":"Ahmed Abd Al-Muti","email":"ahmedmutiddccc@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTYxNTcwZmE3ODk1ZTgxZjA5ZWE5ZiIsIm5hbWUiOiJBaG1lZCBBYmQgQWwtTXV0aSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM4OTM3NzEzLCJleHAiOjE3NDY3MTM3MTN9.34S0_YO9vxFg75e-mbfUk9WErOUxxldwBBKoOZRqOS0"

class RegisterRespondseDm extends RegisterResponseEntity {
  RegisterRespondseDm(
      {super.message, super.user, super.token, super.statusMsg});

  RegisterRespondseDm.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDm.fromJson(json['user']) : null;
    token = json['token'];
    statusMsg = json['statusMsg'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (super.user != null) {
      map['user'] = user;
    }
    map['token'] = token;
    map['statusMsg'] = statusMsg;

    return map;
  }
}

/// name : "Ahmed Abd Al-Muti"
/// email : "ahmedmutiddccc@gmail.com"
/// role : "user"

class UserDm extends UserEntity {
  UserDm({
    super.name,
    super.email,
    super.role,
  });

  UserDm.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['role'] = role;
    return map;
  }
}
