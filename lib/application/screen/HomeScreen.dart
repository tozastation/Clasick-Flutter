import 'package:clasick_flutter/application/module/Home.dart';
import 'package:flutter/material.dart';
import 'package:clasick_flutter/screens/sample.dart';
import 'package:clasick_flutter/screens/playlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  HomeBloc _homeBloc;

  final List<Widget> _children = [
    Playlist(),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green)
  ];

  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: 0,
        stream: _homeBloc.pageIndexStream,
        builder: (context, snapshot) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Clasick'),
        ),
        body: _children[(snapshot.data)],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: snapshot.data,
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.list),
              title: new Text('PlayList'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.audiotrack),
              title: new Text('My Music'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Search'))
          ],
        ),
      );
    });
  }

  void onTabTapped(int index) {
    _homeBloc.dispatch(NavigationBottomBarTapped(index: index));
  }
}
