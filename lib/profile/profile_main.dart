import 'package:company_project/model/detail_profile.dart';
import 'package:company_project/repositories/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:company_project/common/common.dart';
import 'bloc/bloc.dart';

class ProfileMain extends StatefulWidget {
  final String _url;

  ProfileMain({
    Key key,
    @required String url,
  })  : assert(url != null),
        _url = url,
        super(key: key);

  @override
  State<ProfileMain> createState() => _ProfileMainState();
}

class _ProfileMainState extends State<ProfileMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String get _url => widget._url;
  ProfileBloc _profileBloc;
  DetailProfile _detailProfile;

  @override
  void initState() {
    super.initState();
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _profileBloc.add(ProfileLoad(url: _url));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        print("state.isLoaded : ${state.isLoaded}");
        if (state.isLoaded) {
          setState(() {
            _detailProfile = state.detailProfile;
            print("]---] _detailProfile : $_detailProfile [---[");
          });
        }
      },
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state.isLoaded)
          return SafeArea(
              child: Scaffold(
                body: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.8,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [
                            0.05,
                            MediaQuery.of(context).size.width * 0.01,
                          ],
                              colors: [
                            Colors.black,
                            Colors.grey[500],
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0, bottom: 8.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "${_detailProfile.public_repos}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15.0,fontWeight: FontWeight.bold),
                                      ),
                                      Text("Repositories",style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),),
                                    ],
                                  ),
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "${_detailProfile.followers}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15.0,fontWeight: FontWeight.bold),
                                      ),
                                      Text("Followers",style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),),
                                    ],
                                  ),

                                  Column(
                                    children: <Widget>[
                                      Text(
                                        "${_detailProfile.following}",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15.0,fontWeight: FontWeight.bold),
                                      ),
                                      Text("Following",style: TextStyle(
                                          color: Colors.white, fontSize: 15.0),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 22.0,
                                  backgroundImage:
                                      NetworkImage(_detailProfile.avatar_url),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _detailProfile.login,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 30.0),
                                    ),
                                    Text(_detailProfile.name ?? '',
                                        style: TextStyle(color: Colors.grey)),
                                  ],
                                ),
//                                   Text(
//                                      "Created ${_detailProfile.created_at}",style: TextStyle(
//                                       color: Colors.white, fontSize: 15.0),),
                              ],
                            ),
                            SizedBox(height: 10.0,),
                            _buildCard(Icons.email, _detailProfile.email),
                            _buildCard(Icons.location_on, _detailProfile.location),
                            _buildCard(Icons.web, _detailProfile.blog),

                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 2,
                        padding:
                            EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.assignment),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Text("${_detailProfile.login}'s Repositories")
                              ],
                            ),
                            Expanded(
                              child: RepositoriesScreen(url: _detailProfile.repos_url),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          else
            return LoadingIndicator();
        },
      ),
    );
  }

  Widget _buildCard(IconData icon, String text) {
    if (text != null) {
      return Card(
        child: Row(
          children: <Widget>[
            Icon(icon),
            SizedBox(
              width: 8.0,
            ),
            Text(text),
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }

//  Column(
//  children: <Widget>[Text("$_url")],
//  ),
  @override
  void dispose() {
    super.dispose();
  }
}
