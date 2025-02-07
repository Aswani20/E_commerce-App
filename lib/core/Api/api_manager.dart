import 'package:dio/dio.dart';
import 'package:e_commerce_app/core/Api/api_constants.dart';
import 'package:e_commerce_app/core/Api/api_endpoints.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  final dio = Dio();

  // https://ecommerce.routemisr.com/api/v1/auth/signup
  Future<Response> getData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      Options? options}) {
    return dio.get(ApiConstants.baseUrl + endPoint,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }

  Future<Response> postData(
      {required String endPoint,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Map<String, dynamic>? headers,
      Object? body}) {
    return dio.post(ApiConstants.baseUrl + endPoint,
        data: body,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
          validateStatus: (status) => true,
        ));
  }
}
