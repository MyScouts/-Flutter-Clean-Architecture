import 'package:dio/dio.dart';
import 'package:flutter_demo/data/responses/login_response.dart';
import 'package:flutter_demo/data/responses/register_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'rest_service.g.dart';

@lazySingleton
@RestApi()
abstract class AppServiceClient {
  @factoryMethod
  factory AppServiceClient(Dio dio) = _AppServiceClient;
  @POST("/login")
  Future<LoginResponse> login(
    @Field("email") String email,
    @Field("password") String password,
  );

  @POST("/register")
  Future<RegisterResponse> register(
    @Field("user_name") String userName,
    @Field("email") String email,
    @Field("password") String password,
  );
}
