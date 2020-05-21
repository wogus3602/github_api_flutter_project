import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'license.g.dart';

@JsonSerializable(nullable: true, explicitToJson: true)
class License extends Equatable {
  final String name;

  const License({
    this.name,
  });

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'License { name : $name}';
}
