import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileLoad extends ProfileEvent {

  final String url;

  const ProfileLoad({
    @required this.url,
  });

  @override
  List<Object> get props => [url];

  @override
  String toString() => 'ProfileLoad';
}

class ProfileEditClick extends ProfileEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ExerciseDiaryEditClick';
}

class ProfileEditSave extends ProfileEvent {}
