import 'package:dartz/dartz.dart';
import 'package:flutter_demo/data/mapper/mapper.dart';
import 'package:flutter_demo/data/network/error_handler.dart';
import 'package:flutter_demo/data/network/failure.dart';
import 'package:flutter_demo/data/network/network_info.dart';
import 'package:flutter_demo/domain/data_source/remote_data_source.dart';
import 'package:flutter_demo/domain/model/login_object.dart';
import 'package:flutter_demo/domain/request/login_request.dart';
import 'package:flutter_demo/domain/request/register_request.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthObject>> login(LoginRequest loginRequest);
  Future<Either<Failure, AuthObject>> register(RegisterRequest registerRequest);
}

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, AuthObject>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, AuthObject>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.register(registerRequest);
        return Right(response.toDomain());
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
