import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class GitHubContent extends HomeEvent{
  final int since;

  const GitHubContent({
    @required this.since,
  });

  @override
  List<Object> get props => [since];

  @override
  String toString() => 'GitHubContent';
}