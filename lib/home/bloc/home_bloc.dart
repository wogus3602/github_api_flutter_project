import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:company_project/model/github_content.dart';
import 'package:meta/meta.dart';
import 'package:company_project/authentication/bloc.dart';

import 'bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AuthenticationBloc _authenticationBloc;

  HomeBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  HomeState get initialState => HomeState.empty();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is GitHubContent) {
      yield* _getGitHubToState(event.since);
    }
  }

  Stream<HomeState> _getGitHubToState(int since) async* {
    try {
      final response =
          await _authenticationBloc.get('/users?since=$since&per_page=20');
      if (response != null) {
        print("true,falseddd $response");

        final contents = response as List;

        final List<GithubContent> githubContent = contents.map((data) {
          return GithubContent.fromJson(data);
        }).toList();

        yield HomeState.success(githubContent: githubContent);
      }
    } catch (error) {
      yield HomeState.failure();
    }
  }
}
