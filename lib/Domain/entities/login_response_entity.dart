import 'package:e_commerce_app/Data/model/register_respondse_DM.dart';
import 'package:e_commerce_app/Domain/entities/register_response_entity.dart';

/// message : "success"
/// user : {"name":"Ali","email":"adekheel@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY2MTFjY2E3YmU4YjUyMzIzNWI5NWZiMCIsIm5hbWUiOiJBbGkiLCJyb2xlIjoidXNlciIsImlhdCI6MTczOTAxMzgzMiwiZXhwIjoxNzQ2Nzg5ODMyfQ.lXrYLggJnChZ0FXwOnTorknYMr5xsYZC31v1tDNUzcI"

class LoginResponseEntity {
  LoginResponseEntity({this.message, this.user, this.token, this.statusMsg});

  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;
}

/// name : "Ali"
/// email : "adekheel@gmail.com"
/// role : "user"
