import 'package:dartz/dartz.dart';
import 'package:flutter_demo/data/network/failure.dart';
import 'package:flutter_demo/data/network/repository/auth_repository.dart';
import 'package:flutter_demo/domain/model/login_object.dart';
import 'package:flutter_demo/domain/request/login_request.dart';
import 'package:flutter_demo/domain/usecase/base_usecase.dart';

class LoginUseCase extends BaseUseCase<LoginUseCaseInput, AuthObject> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, AuthObject>> execute(LoginUseCaseInput input) async {
    return await _repository.login(LoginRequest(input.email, input.password));
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}
