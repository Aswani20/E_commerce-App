import 'package:e_commerce_app/Data/model/register_respondse_DM.dart';
import 'package:e_commerce_app/Domain/entities/login_response_entity.dart';
import 'package:e_commerce_app/Domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/core/errors/failure.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {
  LoginInitialState();
}

class LoginLoadingState extends LoginStates {
  String msg;
  LoginLoadingState({required this.msg});
}

class LoginSuccessState extends LoginStates {
  LoginResponseEntity loginRespondseEntity;
  LoginSuccessState({required this.loginRespondseEntity});
}

class LoginFailureState extends LoginStates {
  Failure error;
  LoginFailureState({required this.error});
}
