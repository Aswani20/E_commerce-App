import 'package:e_commerce_app/Domain/use_cases/login_use_case.dart';
import 'package:e_commerce_app/Domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/login/cubit/login_states.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates> {
  LoginUseCase loginUseCase;

  LoginViewModel({required this.loginUseCase}) : super(LoginInitialState());

  // todo: hold data
  TextEditingController userNameController =
      TextEditingController(text: "Adekheel@gmail.com");
  TextEditingController passwordController =
      TextEditingController(text: "18061717");
  var formKey = GlobalKey<FormState>();
  // todo: handle logic
  void login() async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState(msg: "loading"));
      var either = await loginUseCase.invoke(
        userNameController.text,
        passwordController.text,
      );

      either.fold((registerResponse) {
        emit(LoginSuccessState(loginRespondseEntity: registerResponse));
      }, (failure) => {emit(LoginFailureState(error: failure))});
    }
  }
}
