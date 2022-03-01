import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'uid')
  String? uid;
  @JsonKey(name: 'disabled')
  bool? disabled;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'proId')
  String? proId;
  @JsonKey(name: 'provider')
  String? provider;
  @JsonKey(name: 'tn')
  String? tn;
  @JsonKey(name: 'tn_160x160')
  String? tn160;
  @JsonKey(name: 'tn_320x320')
  String? tn320;

  UserResponse(this.uid, this.disabled, this.name, this.proId, this.provider,
      this.tn, this.tn160, this.tn320);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
