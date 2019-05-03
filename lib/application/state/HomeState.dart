import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  HomeState([List props = const []]) : super(props);
}

class NowPlaylistScreen extends HomeState {
  @override
  String toString() => 'NowPlaylistScreen';
}

class NowMyMusicScreen extends HomeState {
  @override
  String toString() => 'NowMyMusicScreen';
}

class NowSearchScreen extends HomeState {
  @override
  String toString() => 'NowSearchScreen';
}