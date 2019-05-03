import 'package:json_annotation/json_annotation.dart';

part 'package:clasick_flutter/infrastructure/persistence/model/read/music/Album.g.dart';

@JsonSerializable()
class Album {
  final int id;
  final String name;
  final String iconPath;
  final String artistName;

  Album({this.id, this.name, this.iconPath, this.artistName});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}