import 'package:flutter_demo/data/responses/base_response.dart';
import 'package:flutter_demo/data/responses/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'register_response.g.dart';

@JsonSerializable()
class RegisterResponse extends BaseResponse {
  @JsonKey(name: 'data')
  RegisterDataResponse? data;

  RegisterResponse(this.data);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);
}

@JsonSerializable()
class RegisterDataResponse {
  @JsonKey(name: 'token')
  String? token;
  @JsonKey(name: 'user')
  UserResponse? user;
  RegisterDataResponse(this.token, this.user);

  Map<String, dynamic> toJson() => _$RegisterDataResponseToJson(this);

  factory RegisterDataResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataResponseFromJson(json);
}
