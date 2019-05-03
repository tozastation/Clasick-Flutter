import 'package:clasick_flutter/domain/repository/MusicRepository.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Album.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Artist.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Genre.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Music.dart';
import 'dart:async';

abstract class IMusicService {
  Future<List<Genre>> getAllGenre(int limitNum);
  Future<List<Album>> getAllAlbum(int limitNum);
  Future<List<Artist>> getAllArtist(int limitNum);
  Future<List<Music>> getAllMusic(int limitNum);
}

class MusicServiceImpl implements IMusicService {
  IMusicRepository _musicRepository; // Interface
  MusicServiceImpl(this._musicRepository);

  @override
  Future<List<Music>> getAllMusic(int limitNum) async {
    // TODO: implement getAllMusic
    return await _musicRepository.getAllMusic(limitNum);
  }

  @override
  Future<List<Album>> getAllAlbum(int limitNum) async {
    // TODO: implement getAllAlbum
    return await _musicRepository.getAllAlbum(limitNum);
  }

  @override
  Future<List<Artist>> getAllArtist(int limitNum) async {
    // TODO: implement getAllArtist
    return await _musicRepository.getAllArtist(limitNum);
  }

  @override
  Future<List<Genre>> getAllGenre(int limitNum) async {
    // TODO: implement getAllGenre
    return await _musicRepository.getAllGenre(limitNum);
  }
}