import 'package:json_annotation/json_annotation.dart';

part 'Genre.g.dart';

@JsonSerializable()
class Genre {
  final int id;
  final String name;
  @JsonKey(name: 'icon_path')
  final String iconPath;

  Genre({this.id, this.name, this.iconPath});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}