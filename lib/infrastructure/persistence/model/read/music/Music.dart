import 'package:json_annotation/json_annotation.dart';

part 'package:clasick_flutter/infrastructure/persistence/model/read/music/Music.g.dart';

@JsonSerializable()
class Music {
  final int id;
  final String name;
  final String iconPath;
  final String artistName;

  Music({this.id, this.name, this.iconPath, this.artistName});

  factory Music.fromJson(Map<String, dynamic> json) => _$MusicFromJson(json);

  Map<String, dynamic> toJson() => _$MusicToJson(this);
}