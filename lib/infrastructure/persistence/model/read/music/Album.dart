import 'package:json_annotation/json_annotation.dart';

part 'Album.g.dart';

@JsonSerializable()
class Album {
  final int id;
  final String name;
  @JsonKey(name: 'icon_path')
  final String iconPath;
  @JsonKey(name: 'artist_name')
  final String artistName;

  Album({this.id, this.name, this.iconPath, this.artistName});

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);

  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}