import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();

  @override
  List<Object> get props => [];
}

class RepositoriesLoad extends RepositoriesEvent {

  final String url;

  const RepositoriesLoad({
    @required this.url,
  });

  @override
  List<Object> get props => [url];

  @override
  String toString() => 'RepositoriesLoad';
}

class RepositoriesEditClick extends RepositoriesEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ExerciseDiaryEditClick';
}

class RepositoriesEditSave extends RepositoriesEvent {}
