// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return Playlist(
      json['id'] as int, json['title'] as String, json['iconPath'] as String);
}

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'iconPath': instance.iconPath
    };
