import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:company_project/model/detail_profile.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import 'package:company_project/authentication/authentication_bloc.dart';
import 'bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthenticationBloc _authenticationBloc;

  ProfileBloc({
    @required AuthenticationBloc authenticationBloc,
  })  : assert(authenticationBloc != null),
        _authenticationBloc = authenticationBloc;

  @override
  ProfileState get initialState => ProfileState.empty();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is ProfileLoad) {
      yield* _mapProfileLoadToState(event.url);
    } else if (event is ProfileEditClick) yield* _mapProfileEditClickToState();
  }

  Stream<ProfileState> _mapProfileLoadToState(String url) async* {
    try {
      Map<String,dynamic> response = await _authenticationBloc.get('/users${url.substring(28)}');

      if (response != null) {

        print("true,falseddd ${response}");

        DetailProfile detailProfile = DetailProfile.fromJson(response);



        yield ProfileState.success(detailProfile: detailProfile);
      }
    } catch (error) {
      print("$error");
      yield ProfileState.failure();
    }
  }

  Stream<ProfileState> _mapProfileEditClickToState() async* {
    try {
      yield ProfileState.success();
    } catch (error) {
      yield ProfileState.failure();
    }
  }
}
