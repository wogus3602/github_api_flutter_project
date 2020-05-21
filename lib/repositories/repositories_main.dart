import 'package:company_project/model/repositories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:company_project/common/common.dart';
import 'package:heatmap_calendar/heatmap_calendar.dart';
import 'package:heatmap_calendar/time_utils.dart';
import 'bloc/bloc.dart';

class RepositoriesMain extends StatefulWidget {
  final String _url;

  RepositoriesMain({
    Key key,
    @required String url,
  })  : assert(url != null),
        _url = url,
        super(key: key);

  @override
  State<RepositoriesMain> createState() => _RepositoriesMainState();
}

class _RepositoriesMainState extends State<RepositoriesMain> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String get _url => widget._url;
  RepositoriesBloc _repositoriesBloc;
  List<Repositories> _repositories;
  int len = 0;

  @override
  void initState() {
    super.initState();
    _repositoriesBloc = BlocProvider.of<RepositoriesBloc>(context);
    _repositoriesBloc.add(RepositoriesLoad(url: _url));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RepositoriesBloc, RepositoriesState>(
      listener: (context, state) {
        if (state.isLoaded) {
          _repositories = state.repositories;
          len = _repositories.length;

        }
      },
      child: BlocBuilder<RepositoriesBloc, RepositoriesState>(
        builder: (context, state) {
          print("len ${state.isLoaded}");
          if (state.isLoaded)
            if(len==0){
              return Text("No Repositories");
            }else
            return Column(
              children: <Widget>[
                Container(
                  height: 250.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(16.0),
                      itemCount: len,
                      itemBuilder: (context, i) {
                        return _buildRow(_repositories[i]);
                      }),
                ),
              ],
            );
          else
            return LoadingIndicator();
        },
      ),
    );
  }

  Widget _buildRow(Repositories repositories) {
    String _name = repositories.name ?? '';
    String _description = repositories.description ?? 'No Description';
    String _language = repositories.language ?? 'No Language';
    int _stargazersCount = repositories.stargazers_count ?? 0;
    int _forksCount = repositories.forks_count ?? 0;
    String _updatedAt = repositories.updated_at ?? '';
    return Container(
        width: 300.0,
        child: Card(
            color: Colors.black54,
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              _name,
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 19.0),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.star),
                              Text(
                                _stargazersCount.toString(),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "updated : ${_updatedAt}",
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                      child: Text(
                    _description,
                    style: TextStyle(color: Colors.white),
                  )),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 10.0,
                            height: 10.0,
                            decoration: BoxDecoration(
                                color: Colors.orange, shape: BoxShape.circle),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(_language),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          repositories.license != null
                              ? Text(repositories.license.name.length <=12 ? repositories.license.name : "${repositories.license.name.substring(0,12)}...")
                              : Text(""),
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(Icons.device_hub),
                          Text(_forksCount.toString()),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
