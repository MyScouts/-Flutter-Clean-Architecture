import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginViewObject with _$LoginViewObject {
  factory LoginViewObject(String userName, String password, bool isRemember) =
      _LoginViewObject;
}

@freezed
class RegisterViewObject with _$RegisterViewObject {
  factory RegisterViewObject(
      String userName,
      String email,
      String repeatEmail,
      String password,
      String repeatPassword,
      bool isAcceptTerm) = _RegisterViewObject;
}
