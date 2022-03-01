import 'package:dartz/dartz.dart';
import 'package:flutter_demo/data/network/failure.dart';
import 'package:flutter_demo/data/network/repository/auth_repository.dart';
import 'package:flutter_demo/domain/model/login_object.dart';
import 'package:flutter_demo/domain/request/register_request.dart';
import 'package:flutter_demo/domain/usecase/base_usecase.dart';

class RegisterUseCase extends BaseUseCase<RegisterUseCaseInput, AuthObject> {
  final AuthRepository _repository;

  RegisterUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, AuthObject>> execute(
      RegisterUseCaseInput input) async {
    return await _repository
        .register(RegisterRequest(input.nickName, input.email, input.password));
  }
}

class RegisterUseCaseInput {
  String nickName;
  String email;
  String password;

  RegisterUseCaseInput(this.nickName, this.email, this.password);
}
