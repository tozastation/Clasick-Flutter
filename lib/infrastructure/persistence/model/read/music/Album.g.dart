// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Album _$AlbumFromJson(Map<String, dynamic> json) {
  return Album(
      id: json['id'] as int,
      name: json['name'] as String,
      iconPath: json['iconPath'] as String,
      artistName: json['artistName'] as String);
}

Map<String, dynamic> _$AlbumToJson(Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iconPath': instance.iconPath,
      'artistName': instance.artistName
    };
