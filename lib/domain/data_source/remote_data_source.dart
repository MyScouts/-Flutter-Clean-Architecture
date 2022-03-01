import 'package:flutter_demo/data/network/rest_service.dart';
import 'package:flutter_demo/data/responses/login_response.dart';
import 'package:flutter_demo/data/responses/register_response.dart';
import 'package:flutter_demo/domain/request/login_request.dart';
import 'package:flutter_demo/domain/request/register_request.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<RegisterResponse> register(RegisterRequest loginRequest);
}

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return _appServiceClient.login(loginRequest.email, loginRequest.password);
  }

  @override
  Future<RegisterResponse> register(RegisterRequest registerRequest) async {
    return _appServiceClient.register(registerRequest.nickName,
        registerRequest.email, registerRequest.password);
  }
}
