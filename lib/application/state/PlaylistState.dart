import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Playlist.dart';
import 'package:equatable/equatable.dart';

abstract class PlaylistState extends Equatable {
  PlaylistState([List props = const []]) : super(props);
}

class PlaylistLoading extends PlaylistState {
  @override
  String toString() => 'PlaylistLoading';
}

class PlaylistError extends PlaylistState {
  @override
  String toString() => 'PlaylistError';
}

class PlaylistResult extends PlaylistState {
  final List<Playlist> result;
  PlaylistResult(this.result);
  @override
  String toString() => 'PlaylistResult';
}

class PlaylistEmpty extends PlaylistState {
  @override
  String toString() => 'PlaylistEmpty';
}