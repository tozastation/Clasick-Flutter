import 'package:json_annotation/json_annotation.dart';

part 'SignUp.g.dart';

@JsonSerializable(nullable: false)
class SignUp {
  // KeyMapping
  @JsonKey(name: 'user_id', nullable: false)
  final String userID;

  @JsonKey(name: 'password', nullable: false)
  final String password;

  SignUp(this.userID, this.password);

  factory SignUp.fromJson(Map<String, dynamic> json) => _$SignUpFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpToJson(this);
}