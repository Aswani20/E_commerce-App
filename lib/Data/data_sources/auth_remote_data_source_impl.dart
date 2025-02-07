import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Data/model/register_respondse_DM.dart';
import 'package:e_commerce_app/Domain/Repositories/data_sources/remote_data_source/auth_remote_data_source.dart';
import 'package:e_commerce_app/Domain/entities/register_response_entity.dart';
import 'package:e_commerce_app/core/Api/api_endpoints.dart';
import 'package:e_commerce_app/core/Api/api_manager.dart';
import 'package:e_commerce_app/core/errors/failure.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiManager apiManager;
  AuthRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<Either<RegisterRespondseDm, Failure>> register(String name,
      String email, String password, String rePassword, String phoneNo) async {
    // TODO: implement register
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();

      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var response =
            await apiManager.postData(endPoint: ApiEndPoint.signUp, body: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phoneNo
        });

        var registerResponse = RegisterRespondseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Left(registerResponse);
        } else {
          return Right(ServerError(errorMsg: registerResponse.message!));
        }
      } else {
        //todo: no internet connection
        return Right(
            NetworkError(errorMsg: "Please check internet connection"));
      }
    } catch (error) {
      return Right(ServerError(errorMsg: error.toString()));
    }
  }
}
