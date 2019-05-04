import 'package:clasick_flutter/application/bloc/NavigationBloc.dart';
import 'package:flutter/material.dart';
import 'package:clasick_flutter/screens/sample.dart';
import 'package:clasick_flutter/screens/playlist.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  NavigationBloc _navigationBloc;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _navigationBloc = NavigationBloc();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _navigationBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: StreamBuilder<Navigation>(
        stream: _navigationBloc.currentNavigationIndex,
        initialData: Navigation.PLAYLIST,
        builder: (context, AsyncSnapshot<Navigation> snapshot) {
          _selectedIndex = snapshot.data.index;
          switch (snapshot.data) {
            case Navigation.PLAYLIST:
              return Playlist();
            case Navigation.MY_MUSIC:
              return PlaceholderWidget(Colors.deepOrange);
            case Navigation.SEARCH:
              return PlaceholderWidget(Colors.amberAccent);
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _selectedIndex,
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
              icon: Icon(Icons.search),
              title: Text('Search')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    _navigationBloc.changeNavigationIndex(Navigation.values[index]);
  }
}
