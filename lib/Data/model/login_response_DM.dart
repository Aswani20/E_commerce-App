import 'package:e_commerce_app/Data/model/register_respondse_DM.dart';
import 'package:e_commerce_app/Domain/entities/login_response_entity.dart';

class LoginResponseDm extends LoginResponseEntity {
  LoginResponseDm({super.message, super.user, super.token, super.statusMsg});

  LoginResponseDm.fromJson(dynamic json) {
    message = json['message'];
    user = json['user'] != null ? UserDm.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (user != null) {
      map['user'] = user;
    }
    map['token'] = token;
    return map;
  }
}
