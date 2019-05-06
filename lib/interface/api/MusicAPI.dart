import 'dart:convert';
import 'dart:io';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Album.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Artist.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Music.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Playlist.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/AccessToken.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Genre.dart';
import "dart:convert" show utf8;

abstract class IMusicAPI {
  Future<List<Genre>> getAllGenre(int limitNum);
  Future<List<Album>> getAllAlbum(int limitNum);
  Future<List<Artist>> getAllArtist(int limitNum);
  Future<List<Music>> getAllMusic(int limitNum);
  Future<List<Playlist>> getAllMyPlaylist(AccessToken accessToken);
}

class MusicAPI implements IMusicAPI {
  // Create Singleton Object
  static MusicAPI _instance;
  final rootURL = DotEnv().env['ROOT'];
  factory MusicAPI() {
    if (_instance == null) _instance = new MusicAPI._internal();
    return _instance;
  }
  MusicAPI._internal();

  @override
  Future<List<Genre>> getAllGenre(int limitNum) async {
    // TODO: implement getAllGenre
    final response = await http.get(rootURL + DotEnv().env['GENRE']);
    Iterable list = json.decode(response.body);
    List<Genre> genres = list.map((i) => Genre.fromJson(i)).toList();
    return genres;
  }

  @override
  Future<List<Album>> getAllAlbum(int limitNum) async {
    // TODO: implement getAllAlbum
    final response = await http.get(rootURL + DotEnv().env['ALBUM']);
    Iterable list = json.decode(response.body);
    List<Album> album = list.map((i) => Album.fromJson(i)).toList();
    return album;
  }

  @override
  Future<List<Artist>> getAllArtist(int limitNum) async {
    // TODO: implement getAllArtist
    final response = await http.get(rootURL + DotEnv().env['ARTIST']);
    Iterable list = json.decode(response.body);
    List<Artist> artists = list.map((i) => Artist.fromJson(i)).toList();
    return artists;
  }

  @override
  Future<List<Music>> getAllMusic(int limitNum) async {
    // TODO: implement getAllMusic
    final response = await http.get(rootURL + DotEnv().env['MUSIC']);
    Iterable list = json.decode(response.body);
    List<Music> music = list.map((i) => Music.fromJson(i)).toList();
    return music;
  }

  @override
  Future<List<Playlist>> getAllMyPlaylist(AccessToken accessToken) async {
    // TODO: implement getAllMyPlaylist
    print(rootURL + DotEnv().env['PLAYLIST']);
    final response = await http.get(
      rootURL + DotEnv().env['PLAYLIST'],
      headers: {HttpHeaders.authorizationHeader: "Basic " + accessToken.accessToken},
    );
    Iterable list = await json.decode(utf8.decode(response.bodyBytes));
    List<Playlist> playlists = list.map((i) => Playlist.fromJson(i)).toList();
    return playlists;
  }
}