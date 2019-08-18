import 'package:json_annotation/json_annotation.dart';

part 'AccessToken.g.dart';

@JsonSerializable(nullable: false)
class AccessToken {
  // KeyMapping
  @JsonKey(name: 'value', nullable: false)
  final String value;

  AccessToken(this.value);

  factory AccessToken.fromJson(Map<String, dynamic> json) => _$AccessTokenFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenToJson(this);
}