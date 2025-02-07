import 'package:e_commerce_app/Data/model/register_respondse_DM.dart';
import 'package:e_commerce_app/Domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/core/errors/failure.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {
  RegisterInitialState();
}

class RegisterLoadingState extends RegisterStates {
  String msg;
  RegisterLoadingState({required this.msg});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponseEntity registerRespondseEntity;
  RegisterSuccessState({required this.registerRespondseEntity});
}

class RegisterFailureState extends RegisterStates {
  Failure error;
  RegisterFailureState({required this.error});
}
