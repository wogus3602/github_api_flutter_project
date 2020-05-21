import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detail_profile.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class DetailProfile extends Equatable {
  final int id;
  final String login;
  final String avatar_url;
  final String followers_url;
  final String following_url;
  final String subscriptions_url;
  final String organizations_url;
  final String repos_url;
  final String name;
  final String company;
  final String blog;
  final String location;
  final String email;
  final int public_repos;
  final int public_gists;
  final int followers;
  final int following;
  final String created_at;
  final String updated_at;

  const DetailProfile({
      this.id,
      this.login,
      this.avatar_url,
      this.followers_url,
      this.following_url,
      this.subscriptions_url,
      this.organizations_url,
      this.repos_url,
      this.name,
      this.company,
      this.blog,
      this.location,
      this.email,
      this.public_repos,
      this.public_gists,
      this.followers,
      this.following,
      this.created_at,
      this.updated_at
  });

  factory DetailProfile.fromJson(Map<String, dynamic> json) =>
      _$DetailProfileFromJson(json);

  Map<String, dynamic> toJson() => _$DetailProfileToJson(this);

  @override
  List<Object> get props => [
        id,
        login,
        avatar_url,
        followers_url,
        following_url,
        subscriptions_url,
        organizations_url,
        repos_url,
        name,
        company,
        blog,
        location,
        email,
        public_repos,
        public_gists,
        followers,
        following,
        created_at,
        updated_at
      ];

  @override
  String toString() =>
      'Content { id: $id name : $name}';
}
