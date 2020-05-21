import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:company_project/authentication/authentication_bloc.dart';

import 'bloc/bloc.dart';
import 'repositories.dart';


class RepositoriesScreen extends StatefulWidget {
  final String _url;
  RepositoriesScreen({
    Key key,
    @required String url,
  }) : assert(url != null),
        _url = url,
        super(key: key);

  @override
  _RepositoriesScreenState createState() => _RepositoriesScreenState();
}

class _RepositoriesScreenState extends State<RepositoriesScreen> {

  String get _url => widget._url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<RepositoriesBloc>(
        create: (context) => RepositoriesBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: RepositoriesMain(url: _url,),
      ),
    );
  }
}
