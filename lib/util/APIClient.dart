import 'dart:convert';

import 'package:clasick_flutter/domain/model/Music.dart';
import 'package:clasick_flutter/domain/model/Playlist.dart';
import 'package:http/http.dart' as http;

abstract class IAPIClient {
  // playlists
  Future<List<Playlist>> getPlaylists();
  Future<List<Music>> getPlaylistDetail(int playlistID);
}

class APIClient extends IAPIClient {
  // ---Set Singleton---
  static final APIClient _singleton = new APIClient._internal();
  factory APIClient() {
    return _singleton;
  }
  APIClient._internal();
  // ---Set Singleton---
  String _baseURL = "http://private-d3a9b2-clasick.apiary-mock.com/";

  Future<List<Playlist>> getPlaylists() async {
    http.Response response = await http.get(this._baseURL + "playlists");
    if (response.statusCode == 200) {
      Iterable l = json.decode(utf8.decode(response.bodyBytes));
      List<Playlist> playlists = l.map((i) => Playlist.fromJson(i)).toList();
      return playlists;
    } else {
      throw Exception('Request Error: ${response.statusCode}');
    }
  }

  Future<List<Music>> getPlaylistDetail(int playlistID) async {
    http.Response response =
        await http.get(this._baseURL + "playlists/" + playlistID.toString());
    if (response.statusCode == 200) {
      Iterable l = json.decode(utf8.decode(response.bodyBytes));
      List<Music> musicList = l.map((i) => Music.fromJson(i)).toList();
      return musicList;
    } else {
      throw Exception('Request Error: ${response.statusCode}');
    }
  }
}
