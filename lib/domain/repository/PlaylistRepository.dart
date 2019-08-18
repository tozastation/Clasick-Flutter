import 'package:clasick_flutter/domain/model/Playlist.dart';

abstract class PlaylistRepository {
  Future<List<Playlist>> getAll();
  Future<Playlist> getSingle(int id);
  Future<Playlist> post(Playlist model);
}
