import 'package:company_project/model/github_content.dart';
import 'package:company_project/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:company_project/common/loading_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'bloc/bloc.dart';

class HomeMain extends StatefulWidget {
  HomeMain({
    Key key,
  }) : super(key: key);

  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  HomeBloc _homeBloc;
  RefreshController _refreshController;
  int _indexPage = 0;
  int _usersCount = 0;
  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController(initialRefresh: false);
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(GitHubContent(since: 0));
    _usersCount += 19;
  }

  List<GithubContent> _githubContent;
  var content;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        print("]---] state.isLoaded ${state.isLoaded} [---[");
        if (state.isLoaded) {
          setState(() {
            if(_githubContent == null)
              _githubContent = state.githubContent;
            else
              _githubContent += state.githubContent;
              print("]---] state.isLoaded ${_githubContent[0]}");
            _indexPage = _githubContent[_usersCount].id;
            _usersCount += 19;
          });
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isLoaded) {
            int index = 0;
            return SmartRefresher(
              enablePullDown: false,
              enablePullUp: true,
              controller: _refreshController,
              onRefresh: _onRefresh,
              onLoading: _onLoading,
              child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: _githubContent.length,
                  itemBuilder: (context, i) {
                    if (i.isOdd) return Divider();
                    index = i ~/ 2;
                    print("index $index");
                    return _buildRow(_githubContent[index]);
                  }),

            );
          } else
            return LoadingIndicator();
        },
      ),
    );
  }


  void _onRefresh() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    await Future.delayed(Duration(milliseconds: 1000));
    _homeBloc.add(GitHubContent(since: _indexPage));
    _indexPage += 20;
    if(mounted)
      setState(() {

      });
    _refreshController.loadComplete();
  }

  Widget _buildRow(GithubContent githubContent) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ProfileScreen(url : githubContent.url);
        }));
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 22.0,
          backgroundImage: NetworkImage(githubContent.avatar_url),
        ),
        title: Text(
          githubContent.login,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
