import 'package:json_annotation/json_annotation.dart';

part 'AccessToken.g.dart';

@JsonSerializable()
class AccessToken {
  @JsonKey(name: 'access_token')
  final String accessToken ;

  AccessToken({this.accessToken});

  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}