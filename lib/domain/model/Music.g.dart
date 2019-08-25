// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Music _$MusicFromJson(Map<String, dynamic> json) {
  return Music(
      json['id'] as int,
      json['title'] as String,
      json['icon_path'] as String,
      json['artist_name'] as String,
      json['description'] as String,
      json['music_path'] as String,
      json['genre'] as String);
}

Map<String, dynamic> _$MusicToJson(Music instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon_path': instance.iconPath,
      'artist_name': instance.artistName,
      'description': instance.description,
      'music_path': instance.musicPath,
      'genre': instance.genre
    };
