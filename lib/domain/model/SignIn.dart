import 'package:json_annotation/json_annotation.dart';

part 'SignIn.g.dart';

@JsonSerializable(nullable: false)
class SignIn {
  // KeyMapping
  @JsonKey(name: 'user_id', nullable: false)
  final String userID;

  @JsonKey(name: 'password', nullable: false)
  final String password;

  SignIn(this.userID, this.password);

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);
  Map<String, dynamic> toJson() => _$SignInToJson(this);
}