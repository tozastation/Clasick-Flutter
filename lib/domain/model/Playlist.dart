import 'package:json_annotation/json_annotation.dart';

part 'Playlist.g.dart';

@JsonSerializable(nullable: false)
class Playlist {
  // KeyMapping
  @JsonKey(name: 'id', nullable: false)
  final int id;

  @JsonKey(name: 'name', nullable: false)
  final String title;

  @JsonKey(name: 'icon_path', nullable: false)
  final String iconPath;

  @JsonKey(name: 'description', nullable: false)
  final String description;

  Playlist(this.id, this.title, this.iconPath, this.description);

  factory Playlist.fromJson(Map<String, dynamic> json) =>
      _$PlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}
