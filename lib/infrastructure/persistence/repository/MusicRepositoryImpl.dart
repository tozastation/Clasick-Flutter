import 'package:clasick_flutter/domain/repository/MusicRepository.dart';
import 'package:clasick_flutter/interface/api/MusicAPI.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Album.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Artist.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Genre.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Music.dart';

class MusicRepositoryImpl implements IMusicRepository {
  IMusicAPI _musicAPI;
  MusicRepositoryImpl(this._musicAPI);

  @override
  Future<List<Artist>> getAllArtist(int limitNum) async {
    // TODO: implement getAllArtist
    return await _musicAPI.getAllArtist(limitNum);
  }

  @override
  Future<List<Album>> getAllAlbum(int limitNum) async {
    // TODO: implement getAllAlbum
    return await _musicAPI.getAllAlbum(limitNum);
  }

  @override
  Future<List<Music>> getAllMusic(int limitNum) async {
    // TODO: implement getAllMusic
    return await _musicAPI.getAllMusic(limitNum);
  }

  @override
  Future<List<Genre>> getAllGenre(int limitNum) async {
    // TODO: implement getAllGenre
    return await _musicAPI.getAllGenre(limitNum);
  }
}