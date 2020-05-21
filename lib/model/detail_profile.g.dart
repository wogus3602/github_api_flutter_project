// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DetailProfile _$DetailProfileFromJson(Map<String, dynamic> json) {
  return DetailProfile(
    id: json['id'] as int,
    login: json['login'] as String,
    avatar_url: json['avatar_url'] as String,
    followers_url: json['followers_url'] as String,
    following_url: json['following_url'] as String,
    subscriptions_url: json['subscriptions_url'] as String,
    organizations_url: json['organizations_url'] as String,
    repos_url: json['repos_url'] as String,
    name: json['name'] as String,
    company: json['company'] as String,
    blog: json['blog'] as String,
    location: json['location'] as String,
    email: json['email'] as String,
    public_repos: json['public_repos'] as int,
    public_gists: json['public_gists'] as int,
    followers: json['followers'] as int,
    following: json['following'] as int,
    created_at: json['created_at'] as String,
    updated_at: json['updated_at'] as String,
  );
}

Map<String, dynamic> _$DetailProfileToJson(DetailProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatar_url,
      'followers_url': instance.followers_url,
      'following_url': instance.following_url,
      'subscriptions_url': instance.subscriptions_url,
      'organizations_url': instance.organizations_url,
      'repos_url': instance.repos_url,
      'name': instance.name,
      'company': instance.company,
      'blog': instance.blog,
      'location': instance.location,
      'email': instance.email,
      'public_repos': instance.public_repos,
      'public_gists': instance.public_gists,
      'followers': instance.followers,
      'following': instance.following,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
