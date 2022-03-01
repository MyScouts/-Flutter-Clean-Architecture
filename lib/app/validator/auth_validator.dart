import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_demo/presentation/base/resources/strings_manager.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthValidator {
  AuthValidator();
  String? email(String? value) {
    if (value == '' || value == null) {
      return AppStrings.pleaseEnterYourEmailAddress.tr();
    } else if (!isEmail(value)) {
      return AppStrings.pleaseEnterAValidEmailAddress.tr();
    } else {
      return null;
    }
  }

  String? password(String? value) {
    // final length = value?.runes.length;
    if (value == '' || value == null) {
      return AppStrings.pleaseEnterYourPassword.tr();
    } else if (value.length < 6) {
      return AppStrings.pleaseEnterThePasswordWithAtLeast_6Characters.tr();
    } else {
      return null;
    }
  }

  String? nickName(String? value) {
    if (value == '' || value == null) {
      return AppStrings.pleaseEnterANickname.tr();
    } else {
      return null;
    }
  }

  String? emailConfirm(String? value, String? email) {
    if (value == '' || value == null) {
      return AppStrings.pleaseEnterYourEmailAddressConfirmation.tr();
    } else if (value != email) {
      return AppStrings.theInputContentsAreDifferent.tr();
    } else {
      return null;
    }
  }

  String? passwordConfirm(String? value, String? password) {
    if (value == '' || value == null) {
      return AppStrings.pleaseEnterThePasswordForConfirmation.tr();
    } else if (value != password) {
      return AppStrings.theInputContentsAreDifferent.tr();
    } else {
      return null;
    }
  }
}

bool hasMatch(String? value, String pattern) {
  return (value == null) ? false : RegExp(pattern).hasMatch(value);
}

bool isEmail(String s) => hasMatch(s,
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
