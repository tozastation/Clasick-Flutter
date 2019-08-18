import 'package:clasick_flutter/domain/model/Music.dart';
import 'package:clasick_flutter/domain/model/Playlist.dart';

abstract class MusicService {
  Future<List<Playlist>> getAllPlaylist();
  Future<void> createPlaylist();
  Future<void> addMusicForPlaylist();
  Future<void> deletePlaylist();
  Future<List<Music>> getMusicOnPlaylist(int playlistID);
}