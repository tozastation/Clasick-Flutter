import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:clasick_flutter/application/home/Home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>{
  StreamController<int> _pageIndexController= StreamController<int>();
  StreamSink<int> get pageIndex=> _pageIndexController.sink;
  Stream<int> get pageIndexStream => _pageIndexController.stream;

  @override
  HomeState get initialState => NowPlaylistScreen();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is NavigationBottomBarTapped){
      switch(event.getIndex()){
        case 0:
          yield NowPlaylistScreen();
          pageIndex.add(0);
          break;
        case 1:
          yield NowMyMusicScreen();
          pageIndex.add(1);
          break;
        case 2:
          yield NowSearchScreen();
          pageIndex.add(2);
          break;
        default:
          yield NowPlaylistScreen();
          pageIndex.add(0);
      }
    }
  }
}
