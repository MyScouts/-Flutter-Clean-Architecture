import 'package:flutter_demo/domain/model/user.dart';

class AuthObject {
  final String token;
  final User user;
  AuthObject({required this.token, required this.user});
}
