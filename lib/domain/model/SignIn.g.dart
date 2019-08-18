// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignIn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignIn _$SignInFromJson(Map<String, dynamic> json) {
  return SignIn(json['user_id'] as String, json['password'] as String);
}

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'user_id': instance.userID,
      'password': instance.password
    };
