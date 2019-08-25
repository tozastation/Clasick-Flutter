import 'dart:async';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/domain/model/Music.dart';
import 'package:clasick_flutter/util/APIClient.dart';
import 'package:rxdart/rxdart.dart';

class PlaylistDetailBloc implements Bloc {
  IAPIClient _api = APIClient();
  int playlistID;
  final _musicList = BehaviorSubject<List<Music>>();
  Stream<List<Music>> get musicListStream => this._musicList.stream;
  StreamSink<List<Music>> get musicListSink => this._musicList.sink;

  PlaylistDetailBloc(int playlistID) {
    this.playlistID = playlistID;
    refreshPlaylist();
  }

  Future<void> refreshPlaylist() async {
    try {
      final musicList = await _api.getPlaylistDetail(this.playlistID);
      musicList.forEach((p) => print(p.toJson()));
      musicList.isEmpty ? musicListSink.add([]) : musicListSink.add(musicList);
    } catch (e) {
      print("[Error]: $e");
      musicListSink.add([]);
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _musicList.close();
  }
}
