import 'package:clasick_flutter/domain/model/Playlist.dart';
import 'package:clasick_flutter/domain/repository/BaseRepository.dart';
import 'package:meta/meta.dart';

class PlaylistRepositoryImpl implements BaseRepository<Playlist>{
  BaseRepository<Playlist> _repository;
  PlaylistRepositoryImpl(BaseRepository<Playlist> repository)  {
    // Dependency Injection
    _repository = repository;
  }

  @override
  Future<List<Playlist>> getAll() {
    // TODO: implement getAll
    return null;
  }

  @override
  Future<Playlist> getSingle(int id) {
    // TODO: implement getSingle
    return null;
  }

  @override
  Future<Playlist> post(Playlist model) {
    // TODO: implement post
    return null;
  }

}