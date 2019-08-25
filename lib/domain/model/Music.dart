import 'package:json_annotation/json_annotation.dart';

part 'Music.g.dart';

@JsonSerializable(nullable: false)
class Music {
  // KeyMapping
  @JsonKey(name: 'id', nullable: false)
  final int id;

  @JsonKey(name: 'title', nullable: false)
  final String title;

  @JsonKey(name: 'icon_path', nullable: false)
  final String iconPath;

  @JsonKey(name: 'artist_name', nullable: false)
  final String artistName;

  @JsonKey(name: 'description', nullable: false)
  final String description;

  @JsonKey(name: 'music_path', nullable: false)
  final String musicPath;

  @JsonKey(name: 'genre', nullable: false)
  final String genre;

  Music(this.id, this.title, this.iconPath, this.artistName, this.description,
      this.musicPath, this.genre);

  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);
  Map<String, dynamic> toJson() => _$MusicToJson(this);
}
