import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:company_project/model/repositories.dart';
import 'package:meta/meta.dart';
import 'package:company_project/authentication/authentication_bloc.dart';
import 'bloc.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  final AuthenticationBloc _authenticationBloc;

  RepositoriesBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  RepositoriesState get initialState => RepositoriesState.empty();

  @override
  Stream<RepositoriesState> mapEventToState(RepositoriesEvent event) async* {
    if (event is RepositoriesLoad) {
      yield* _mapRepositoriesLoadToState(event.url);
    } else if (event is RepositoriesEditClick)
      yield* _mapRepositoriesEditClickToState();
  }

  Stream<RepositoriesState> _mapRepositoriesLoadToState(String url) async* {
    try {
      final response =
          await _authenticationBloc.get('/users${url.substring(28)}');


      if (response != null) {
        final contents = response as List;

//        print("RepositoriesState response : ${contents[0]['license']} ");

        final List<Repositories> repositories = contents.map((data) {
          return Repositories.fromJson(data);
        }).toList();


        yield RepositoriesState.success(repositories: repositories);
      }
    } catch (error) {
      print("$error");
      yield RepositoriesState.failure();
    }
  }

  Stream<RepositoriesState> _mapRepositoriesEditClickToState() async* {
    try {
      yield RepositoriesState.success();
    } catch (error) {
      yield RepositoriesState.failure();
    }
  }
}
