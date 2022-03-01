import 'package:flutter_demo/app/constants.dart';
import 'package:flutter_demo/data/responses/login_response.dart';
import 'package:flutter_demo/data/responses/register_response.dart';
import 'package:flutter_demo/data/responses/user_response.dart';
import 'package:flutter_demo/domain/model/login_object.dart';
import 'package:flutter_demo/domain/model/user.dart';

extension UserRessponseMapper on UserResponse? {
  User toDomain() {
    return User(
      uid: this?.uid ?? Constants.empty,
      disabled: this?.disabled ?? false,
      name: this?.name ?? Constants.empty,
      provider: this?.provider ?? Constants.empty,
      tn: this?.tn ?? Constants.empty,
    );
  }
}

extension LoginResponseMapper on LoginResponse? {
  AuthObject toDomain() {
    return AuthObject(
        token: this?.data?.token ?? Constants.empty,
        user: User(
          uid: this?.data?.user?.uid ?? Constants.empty,
          disabled: this?.data?.user?.disabled ?? false,
          name: this?.data?.user?.name ?? Constants.empty,
          provider: this?.data?.user?.provider ?? Constants.empty,
          tn: this?.data?.user?.tn ?? Constants.empty,
        ));
  }
}


extension RegisterResponseMapper on RegisterResponse? {
  AuthObject toDomain() {
    return AuthObject(
        token: this?.data?.token ?? Constants.empty,
        user: User(
          uid: this?.data?.user?.uid ?? Constants.empty,
          disabled: this?.data?.user?.disabled ?? false,
          name: this?.data?.user?.name ?? Constants.empty,
          provider: this?.data?.user?.provider ?? Constants.empty,
          tn: this?.data?.user?.tn ?? Constants.empty,
        ));
  }
}