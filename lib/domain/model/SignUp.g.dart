// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignUp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) {
  return SignUp(json['user_id'] as String, json['password'] as String);
}

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'user_id': instance.userID,
      'password': instance.password
    };
