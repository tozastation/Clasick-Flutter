// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Artist _$ArtistFromJson(Map<String, dynamic> json) {
  return Artist(
      id: json['id'] as int,
      name: json['name'] as String,
      iconPath: json['icon_path'] as String,
      description: json['description'] as String);
}

Map<String, dynamic> _$ArtistToJson(Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_path': instance.iconPath,
      'description': instance.description
    };
