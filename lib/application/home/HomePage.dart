import 'package:clasick_flutter/application/home/HomeBloc.dart';
import 'package:clasick_flutter/application/playlist/PlaylistPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  // Initial State
  HomeBloc _bloc;
  @override
  void initState() {
    // TODO: implement initState
    this._bloc = HomeBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Clasick'),
      ),
      body: StreamBuilder<NavBarItem>(
        stream: this._bloc.itemStream,
        initialData: this._bloc.defaultItem,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          switch (snapshot.data) {
            case NavBarItem.Playlist:
              return PlaylistPage();
            case NavBarItem.MyMusic:
              return null;
            case NavBarItem.Search:
              return null;
          }
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: this._bloc.itemStream,
        initialData: this._bloc.defaultItem,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          BottomNavigationBar(
            onTap: this._bloc.pickItem,
            currentIndex: snapshot.data.index,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                title: Text('PlayList'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.audiotrack),
                title: Text('My Music'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Search'),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    this._bloc.dispose();
    super.dispose();
  }
}