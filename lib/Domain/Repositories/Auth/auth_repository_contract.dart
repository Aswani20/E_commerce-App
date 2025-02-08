import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Domain/entities/login_response_entity.dart';
import 'package:e_commerce_app/Domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/core/errors/failure.dart';

abstract class AuthRepositoryContract {
  Future<Either<RegisterResponseEntity, Failure>> register(String name,
      String email, String password, String rePassword, String phoneNo);

  Future<Either<LoginResponseEntity, Failure>> login(
      String email, String password);
}
