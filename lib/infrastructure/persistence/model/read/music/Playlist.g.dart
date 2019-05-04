// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Playlist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Playlist _$PlaylistFromJson(Map<String, dynamic> json) {
  return Playlist(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      iconPath: json['iconPath'] as String);
}

Map<String, dynamic> _$PlaylistToJson(Playlist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'iconPath': instance.iconPath
    };
