import 'package:company_project/model/license.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repositories.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class Repositories extends Equatable {
  final String name;
  final String description;
  final String language;
  final int stargazers_count;
  final int forks_count;
  final License license;
  final String updated_at;

  const Repositories({
    this.name,
    this.description,
    this.language,
    this.stargazers_count,
    this.forks_count,
    this.license,
    this.updated_at,
  });

  factory Repositories.fromJson(Map<String, dynamic> json) =>
      _$RepositoriesFromJson(json);

  Map<String, dynamic> toJson() => _$RepositoriesToJson(this);

  @override
  List<Object> get props => [
        name,
        description,
        language,
        stargazers_count,
        forks_count,
        license,
        updated_at,
      ];

  @override
  String toString() => 'Repositories { name : $name }';
}
