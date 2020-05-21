import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:company_project/authentication/authentication_bloc.dart';

import 'bloc/bloc.dart';
import 'home.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black54,
        leading: Image.asset("images/github_logo2.png"),
        title: Text('Github Users'),
      ),
      body: BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: HomeMain(),
      ),
    );
  }
}
