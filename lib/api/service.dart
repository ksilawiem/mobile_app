import 'package:dio/dio.dart';
import 'package:mobile_app/api/api_models/login_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';

part 'service.g.dart';

@RestApi(baseUrl: "http://172.0.0.1:8000/api/")
abstract class Service {
  factory Service(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
    );
    return _Service(dio, baseUrl: baseUrl);
  }

  @POST('/users/login') // enter your api method
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);


}

