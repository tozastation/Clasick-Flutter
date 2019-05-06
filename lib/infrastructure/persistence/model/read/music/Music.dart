import 'package:json_annotation/json_annotation.dart';

part 'Music.g.dart';

@JsonSerializable()
class Music {
  final int id;
  final String name;
  @JsonKey(name: 'icon_path')
  final String iconPath;
  @JsonKey(name: 'artist_name')
  final String artistName;

  Music({this.id, this.name, this.iconPath, this.artistName});

  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);

  Map<String, dynamic> toJson() => _$MusicToJson(this);
}