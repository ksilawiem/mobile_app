import 'package:dio/dio.dart';
import 'package:mobile_app/api/api_models/login_response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:retrofit/http.dart';

part 'authservice.g.dart';

@RestApi(baseUrl: "http:// 192.168.0.102:8000/api/")
abstract class Authservice {
  factory Authservice(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
    );
    return _Authservice(dio, baseUrl: baseUrl);
  }

  @POST('/users/login') // enter your api method
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @POST('/users/create')
  @FormUrlEncoded() // enter your api method
  Future<LoginResponse> createUser(
      @Field() String firstName,
      @Field() String lastName,
      @Field() String email,
      @Field() String password,
      @Field() String address,
      @Field() String birthDate,
      @Field() String city,
      @Field() String company,
      @Field() String gender); //////////////////////////////////////////

}
