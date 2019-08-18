import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/domain/model/Playlist.dart';
import 'package:rxdart/rxdart.dart';

enum NavBarItem {Playlist, MyMusic, Search}

class HomeBloc implements Bloc {
  NavBarItem defaultItem = NavBarItem.Playlist;
  final StreamController<NavBarItem> _navBarController = StreamController<
      NavBarItem>.broadcast();

  Stream<NavBarItem> get itemStream => _navBarController.stream;

  void pickItem(int i) {
    switch (i) {
      case 0:
        _navBarController.add(NavBarItem.Playlist);
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}