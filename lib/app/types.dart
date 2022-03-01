enum LoginType {
  password,
  facebook,
  google,
  apple,
}

extension LoginTypeExtension on LoginType {
  String getValue() {
    switch (this) {
      case LoginType.password:
        return 'password';
      case LoginType.facebook:
        return 'facebook.com';
      case LoginType.google:
        return 'google.com';
      case LoginType.apple:
        return 'apple.com';
      default:
        return "";
    }
  }
}
