import 'package:company_project/model/repositories.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoriesState {
  final bool isLoaded;
  final bool isLoading;
  final List<Repositories> repositories;

  RepositoriesState({
    @required this.isLoaded,
    @required this.isLoading,
    @required this.repositories,
  });

  factory RepositoriesState.empty() {
    return RepositoriesState(
        isLoaded: false,
        isLoading: false,
        repositories: null);
  }

  factory RepositoriesState.failure() {
    return RepositoriesState(
        isLoaded: false,
        isLoading: false,
        repositories: null);
  }

  factory RepositoriesState.success({List<Repositories> repositories}) {
    return RepositoriesState(
        isLoaded: true,
        isLoading: false,
        repositories: repositories);
  }


  RepositoriesState copyWith({
    bool isLoaded,
    bool isLoading,
    Repositories repositories
  }) {
    return RepositoriesState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      repositories: repositories ?? this.repositories,
    );
  }
}
