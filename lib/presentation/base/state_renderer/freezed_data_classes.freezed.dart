// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LoginViewObjectTearOff {
  const _$LoginViewObjectTearOff();

  _LoginViewObject call(String userName, String password, bool isRemember) {
    return _LoginViewObject(
      userName,
      password,
      isRemember,
    );
  }
}

/// @nodoc
const $LoginViewObject = _$LoginViewObjectTearOff();

/// @nodoc
mixin _$LoginViewObject {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isRemember => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginViewObjectCopyWith<LoginViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginViewObjectCopyWith<$Res> {
  factory $LoginViewObjectCopyWith(
          LoginViewObject value, $Res Function(LoginViewObject) then) =
      _$LoginViewObjectCopyWithImpl<$Res>;
  $Res call({String userName, String password, bool isRemember});
}

/// @nodoc
class _$LoginViewObjectCopyWithImpl<$Res>
    implements $LoginViewObjectCopyWith<$Res> {
  _$LoginViewObjectCopyWithImpl(this._value, this._then);

  final LoginViewObject _value;
  // ignore: unused_field
  final $Res Function(LoginViewObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? isRemember = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isRemember: isRemember == freezed
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$LoginViewObjectCopyWith<$Res>
    implements $LoginViewObjectCopyWith<$Res> {
  factory _$LoginViewObjectCopyWith(
          _LoginViewObject value, $Res Function(_LoginViewObject) then) =
      __$LoginViewObjectCopyWithImpl<$Res>;
  @override
  $Res call({String userName, String password, bool isRemember});
}

/// @nodoc
class __$LoginViewObjectCopyWithImpl<$Res>
    extends _$LoginViewObjectCopyWithImpl<$Res>
    implements _$LoginViewObjectCopyWith<$Res> {
  __$LoginViewObjectCopyWithImpl(
      _LoginViewObject _value, $Res Function(_LoginViewObject) _then)
      : super(_value, (v) => _then(v as _LoginViewObject));

  @override
  _LoginViewObject get _value => super._value as _LoginViewObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? password = freezed,
    Object? isRemember = freezed,
  }) {
    return _then(_LoginViewObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isRemember == freezed
          ? _value.isRemember
          : isRemember // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoginViewObject implements _LoginViewObject {
  _$_LoginViewObject(this.userName, this.password, this.isRemember);

  @override
  final String userName;
  @override
  final String password;
  @override
  final bool isRemember;

  @override
  String toString() {
    return 'LoginViewObject(userName: $userName, password: $password, isRemember: $isRemember)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginViewObject &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.isRemember, isRemember));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(isRemember));

  @JsonKey(ignore: true)
  @override
  _$LoginViewObjectCopyWith<_LoginViewObject> get copyWith =>
      __$LoginViewObjectCopyWithImpl<_LoginViewObject>(this, _$identity);
}

abstract class _LoginViewObject implements LoginViewObject {
  factory _LoginViewObject(String userName, String password, bool isRemember) =
      _$_LoginViewObject;

  @override
  String get userName;
  @override
  String get password;
  @override
  bool get isRemember;
  @override
  @JsonKey(ignore: true)
  _$LoginViewObjectCopyWith<_LoginViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$RegisterViewObjectTearOff {
  const _$RegisterViewObjectTearOff();

  _RegisterViewObject call(String userName, String email, String repeatEmail,
      String password, String repeatPassword, bool isAcceptTerm) {
    return _RegisterViewObject(
      userName,
      email,
      repeatEmail,
      password,
      repeatPassword,
      isAcceptTerm,
    );
  }
}

/// @nodoc
const $RegisterViewObject = _$RegisterViewObjectTearOff();

/// @nodoc
mixin _$RegisterViewObject {
  String get userName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get repeatEmail => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get repeatPassword => throw _privateConstructorUsedError;
  bool get isAcceptTerm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterViewObjectCopyWith<RegisterViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterViewObjectCopyWith<$Res> {
  factory $RegisterViewObjectCopyWith(
          RegisterViewObject value, $Res Function(RegisterViewObject) then) =
      _$RegisterViewObjectCopyWithImpl<$Res>;
  $Res call(
      {String userName,
      String email,
      String repeatEmail,
      String password,
      String repeatPassword,
      bool isAcceptTerm});
}

/// @nodoc
class _$RegisterViewObjectCopyWithImpl<$Res>
    implements $RegisterViewObjectCopyWith<$Res> {
  _$RegisterViewObjectCopyWithImpl(this._value, this._then);

  final RegisterViewObject _value;
  // ignore: unused_field
  final $Res Function(RegisterViewObject) _then;

  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
    Object? repeatEmail = freezed,
    Object? password = freezed,
    Object? repeatPassword = freezed,
    Object? isAcceptTerm = freezed,
  }) {
    return _then(_value.copyWith(
      userName: userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      repeatEmail: repeatEmail == freezed
          ? _value.repeatEmail
          : repeatEmail // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      repeatPassword: repeatPassword == freezed
          ? _value.repeatPassword
          : repeatPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isAcceptTerm: isAcceptTerm == freezed
          ? _value.isAcceptTerm
          : isAcceptTerm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RegisterViewObjectCopyWith<$Res>
    implements $RegisterViewObjectCopyWith<$Res> {
  factory _$RegisterViewObjectCopyWith(
          _RegisterViewObject value, $Res Function(_RegisterViewObject) then) =
      __$RegisterViewObjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String userName,
      String email,
      String repeatEmail,
      String password,
      String repeatPassword,
      bool isAcceptTerm});
}

/// @nodoc
class __$RegisterViewObjectCopyWithImpl<$Res>
    extends _$RegisterViewObjectCopyWithImpl<$Res>
    implements _$RegisterViewObjectCopyWith<$Res> {
  __$RegisterViewObjectCopyWithImpl(
      _RegisterViewObject _value, $Res Function(_RegisterViewObject) _then)
      : super(_value, (v) => _then(v as _RegisterViewObject));

  @override
  _RegisterViewObject get _value => super._value as _RegisterViewObject;

  @override
  $Res call({
    Object? userName = freezed,
    Object? email = freezed,
    Object? repeatEmail = freezed,
    Object? password = freezed,
    Object? repeatPassword = freezed,
    Object? isAcceptTerm = freezed,
  }) {
    return _then(_RegisterViewObject(
      userName == freezed
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      repeatEmail == freezed
          ? _value.repeatEmail
          : repeatEmail // ignore: cast_nullable_to_non_nullable
              as String,
      password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      repeatPassword == freezed
          ? _value.repeatPassword
          : repeatPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isAcceptTerm == freezed
          ? _value.isAcceptTerm
          : isAcceptTerm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_RegisterViewObject implements _RegisterViewObject {
  _$_RegisterViewObject(this.userName, this.email, this.repeatEmail,
      this.password, this.repeatPassword, this.isAcceptTerm);

  @override
  final String userName;
  @override
  final String email;
  @override
  final String repeatEmail;
  @override
  final String password;
  @override
  final String repeatPassword;
  @override
  final bool isAcceptTerm;

  @override
  String toString() {
    return 'RegisterViewObject(userName: $userName, email: $email, repeatEmail: $repeatEmail, password: $password, repeatPassword: $repeatPassword, isAcceptTerm: $isAcceptTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterViewObject &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality()
                .equals(other.repeatEmail, repeatEmail) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality()
                .equals(other.repeatPassword, repeatPassword) &&
            const DeepCollectionEquality()
                .equals(other.isAcceptTerm, isAcceptTerm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(repeatEmail),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(repeatPassword),
      const DeepCollectionEquality().hash(isAcceptTerm));

  @JsonKey(ignore: true)
  @override
  _$RegisterViewObjectCopyWith<_RegisterViewObject> get copyWith =>
      __$RegisterViewObjectCopyWithImpl<_RegisterViewObject>(this, _$identity);
}

abstract class _RegisterViewObject implements RegisterViewObject {
  factory _RegisterViewObject(
      String userName,
      String email,
      String repeatEmail,
      String password,
      String repeatPassword,
      bool isAcceptTerm) = _$_RegisterViewObject;

  @override
  String get userName;
  @override
  String get email;
  @override
  String get repeatEmail;
  @override
  String get password;
  @override
  String get repeatPassword;
  @override
  bool get isAcceptTerm;
  @override
  @JsonKey(ignore: true)
  _$RegisterViewObjectCopyWith<_RegisterViewObject> get copyWith =>
      throw _privateConstructorUsedError;
}
