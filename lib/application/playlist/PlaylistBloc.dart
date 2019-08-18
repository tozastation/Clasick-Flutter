import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/domain/model/Playlist.dart';
import 'package:rxdart/rxdart.dart';

final List<Playlist> seeds = [Playlist(1, "TEST", "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/480px-Instagram_icon.png", "TEST")];

class PlaylistBloc implements Bloc {
  final _playlists = BehaviorSubject<List<Playlist>>();
  Stream<List<Playlist>> get playlistStream => this._playlists.stream;
  StreamSink<List<Playlist>> get playlistSink => this._playlists.sink;

  PlaylistBloc() {
    print("[INFO]: $seeds");
    playlistSink.add(seeds);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _playlists.close();
  }
}