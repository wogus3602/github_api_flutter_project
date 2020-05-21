import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_content.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class GithubContent extends Equatable {
  final int id;
  final String login;
  final String url;
  final String html_url;
  final String avatar_url;

  const GithubContent({
    this.id,
    this.login,
    this.url,
    this.html_url,
    this.avatar_url,
  });

  factory GithubContent.fromJson(Map<String, dynamic> json) =>
      _$GithubContentFromJson(json);

  Map<String, dynamic> toJson() => _$GithubContentToJson(this);

  @override
  List<Object> get props => [id, login, url, html_url, avatar_url];

  @override
  String toString() =>
      'Content { id: $id url : $url login : $login htmlUrl : $html_url avatar_url : $avatar_url}';
}
