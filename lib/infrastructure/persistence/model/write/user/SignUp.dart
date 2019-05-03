import 'package:json_annotation/json_annotation.dart';

part 'SignUp.g.dart';

@JsonSerializable()
class SignUp {
  final String name;
  final String password;
  final String phoneNumber;
  final String email;

  SignUp({this.name, this.password, this.phoneNumber, this.email});

  factory SignUp.fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpToJson(this);
}