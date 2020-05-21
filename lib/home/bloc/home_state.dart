import 'package:company_project/model/github_content.dart';
import 'package:meta/meta.dart';

@immutable
class HomeState {
  final bool isLoaded;
  final bool isLoading;
  final List<GithubContent> githubContent;

  HomeState(
      {@required this.isLoaded,
      @required this.isLoading,
      @required this.githubContent});

  factory HomeState.empty() {
    return HomeState(
      isLoaded: false,
      isLoading: false,
    );
  }

  factory HomeState.failure() {
    return HomeState(
      isLoaded: false,
      isLoading: false,
    );
  }

  factory HomeState.success({List<GithubContent> githubContent}) {
    return HomeState(
      isLoaded: true,
      isLoading: false,
      githubContent: githubContent,
    );
  }

  HomeState copyWith({
    bool isLoaded,
    bool isLoading,
    List<GithubContent> githubContent,
  }) {
    return HomeState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      githubContent: githubContent ?? this.githubContent,
    );
  }
}
