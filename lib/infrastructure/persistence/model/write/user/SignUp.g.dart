// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SignUp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUp _$SignUpFromJson(Map<String, dynamic> json) {
  return SignUp(
      name: json['name'] as String,
      password: json['password'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String);
}

Map<String, dynamic> _$SignUpToJson(SignUp instance) => <String, dynamic>{
      'name': instance.name,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email
    };
