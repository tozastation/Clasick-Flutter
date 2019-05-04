// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Music.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Music _$MusicFromJson(Map<String, dynamic> json) {
  return Music(
      id: json['id'] as int,
      name: json['name'] as String,
      iconPath: json['iconPath'] as String,
      artistName: json['artistName'] as String);
}

Map<String, dynamic> _$MusicToJson(Music instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconPath': instance.iconPath,
      'artistName': instance.artistName
    };
