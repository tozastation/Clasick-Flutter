import 'package:json_annotation/json_annotation.dart';

part 'package:clasick_flutter/infrastructure/persistence/model/read/user/User.g.dart';

@JsonSerializable()
class User {
  final int id;
  final String name;
  final String iconPath;
  final String introduction;

  User({this.id, this.name, this.iconPath, this.introduction});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}