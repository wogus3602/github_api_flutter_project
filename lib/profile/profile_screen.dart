import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:company_project/authentication/authentication_bloc.dart';

import 'bloc/bloc.dart';
import 'profile.dart';


class ProfileScreen extends StatefulWidget {
  final String _url;
  ProfileScreen({
    Key key,
    @required String url,
  }) : assert(url != null),
        _url = url,
        super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  String get _url => widget._url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.black54,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Github'),
      ),
      body: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context)),
        child: ProfileMain(url: _url,),
      ),
    );
  }
}
