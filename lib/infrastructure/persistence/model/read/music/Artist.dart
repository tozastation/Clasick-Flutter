import 'package:json_annotation/json_annotation.dart';

part 'Artist.g.dart';

@JsonSerializable()
class Artist {
  final int id;
  final String name;
  @JsonKey(name: 'icon_path')
  final String iconPath;
  final String description;

  Artist({this.id, this.name, this.iconPath, this.description});

  factory Artist.fromJson(Map<String, dynamic> json) => _$ArtistFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistToJson(this);
}