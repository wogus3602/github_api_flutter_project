// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubContent _$GithubContentFromJson(Map<String, dynamic> json) {
  return GithubContent(
    id: json['id'] as int,
    login: json['login'] as String,
    url: json['url'] as String,
    html_url: json['html_url'] as String,
    avatar_url: json['avatar_url'] as String,
  );
}

Map<String, dynamic> _$GithubContentToJson(GithubContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'url': instance.url,
      'html_url': instance.html_url,
      'avatar_url': instance.avatar_url,
    };
