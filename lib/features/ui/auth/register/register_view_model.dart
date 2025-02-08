import 'package:e_commerce_app/Domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app/features/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterUseCase registerUseCase;

  RegisterViewModel({required this.registerUseCase})
      : super(RegisterInitialState());

  // todo: hold data
  TextEditingController fullNameController =
      TextEditingController(text: "ali dekheel");
  TextEditingController phoneController =
      TextEditingController(text: "01100860890");
  TextEditingController mailController =
      TextEditingController(text: "adasdf@fds.com");
  TextEditingController passwordController =
      TextEditingController(text: "15261548@A");
  TextEditingController rePasswordController =
      TextEditingController(text: "15261548@A");
  var formKey = GlobalKey<FormState>();

  // todo: handle logic
  void register() async {
    if (formKey.currentState!.validate()) {
      emit(RegisterLoadingState(msg: "loading"));
      var either = await registerUseCase.invoke(
          fullNameController.text,
          mailController.text,
          passwordController.text,
          rePasswordController.text,
          phoneController.text);

      either.fold((registerResponse) {
        emit(RegisterSuccessState(registerRespondseEntity: registerResponse));
      }, (failure) => {emit(RegisterFailureState(error: failure))});
    }
  }
}
