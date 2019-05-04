import 'package:json_annotation/json_annotation.dart';

part 'Playlist.g.dart';

@JsonSerializable()
class Playlist {
  final int id;
  final String name;
  final String description;
  final String iconPath;

  Playlist({this.id, this.name, this.description, this.iconPath});

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}