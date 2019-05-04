import 'package:json_annotation/json_annotation.dart';

part 'SignIn.g.dart';

@JsonSerializable()
class SignIn {
  final String name;
  final String password;

  SignIn({this.name, this.password});

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  Map<String, dynamic> toJson() => _$SignInToJson(this);
}