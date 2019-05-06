// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Genre.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Genre _$GenreFromJson(Map<String, dynamic> json) {
  return Genre(
      id: json['id'] as int,
      name: json['name'] as String,
      iconPath: json['icon_path'] as String);
}

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon_path': instance.iconPath
    };
