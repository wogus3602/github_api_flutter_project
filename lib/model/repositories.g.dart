// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Repositories _$RepositoriesFromJson(Map<String, dynamic> json) {
  return Repositories(
    name: json['name'] as String,
    description: json['description'] as String,
    language: json['language'] as String,
    stargazers_count: json['stargazers_count'] as int,
    forks_count: json['forks_count'] as int,
    license: json['license'] == null
        ? null
        : License.fromJson(json['license'] as Map<String, dynamic>),
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$RepositoriesToJson(Repositories instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'language': instance.language,
      'stargazers_count': instance.stargazers_count,
      'forks_count': instance.forks_count,
      'license': instance.license?.toJson(),
      'updated_at': instance.updated_at,
    };
