import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Album.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Artist.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Genre.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Music.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Playlist.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/AccessToken.dart';

abstract class IMusicRepository {
  Future<List<Genre>> getAllGenre(int limitNum);
  Future<List<Album>> getAllAlbum(int limitNum);
  Future<List<Artist>> getAllArtist(int limitNum);
  Future<List<Music>> getAllMusic(int limitNum);
  Future<List<Playlist>> getAllMyPlaylist(AccessToken accessToken);
}