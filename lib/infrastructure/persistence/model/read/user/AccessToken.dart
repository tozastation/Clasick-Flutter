import 'package:json_annotation/json_annotation.dart';

part 'package:clasick_flutter/infrastructure/persistence/model/read/user/AccessToken.g.dart';

@JsonSerializable()
class AccessToken {
  final String accessToken ;

  AccessToken({this.accessToken});

  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}