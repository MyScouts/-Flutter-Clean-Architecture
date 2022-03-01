import 'package:flutter_demo/data/responses/base_response.dart';
import 'package:flutter_demo/data/responses/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: 'data')
  LoginDataResponse? data;

  LoginResponse(this.data);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@JsonSerializable()
class LoginDataResponse {
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'user')
  UserResponse? user;

  LoginDataResponse(this.token, this.user);

  Map<String, dynamic> toJson() => _$LoginDataResponseToJson(this);

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);
}
