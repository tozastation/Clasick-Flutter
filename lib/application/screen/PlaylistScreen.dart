import 'package:clasick_flutter/domain/service/MusicService.dart';
import 'package:clasick_flutter/domain/service/UserService.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Playlist.dart';
import 'package:clasick_flutter/infrastructure/persistence/repository/MusicRepositoryImpl.dart';
import 'package:clasick_flutter/infrastructure/persistence/repository/UserRepositoryImpl.dart';
import 'package:clasick_flutter/interface/api/MusicAPI.dart';
import 'package:clasick_flutter/interface/api/UserAPI.dart';
import 'package:clasick_flutter/interface/kvs/KVSManager.dart';
import 'package:flutter/material.dart';
import 'package:clasick_flutter/screens/playlist_detail.dart';
import 'package:clasick_flutter/application/bloc/PlaylistBloc.dart';

class PlaylistScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlaylistScreenState();
  }
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  PlaylistBloc _playlistBloc;

  @override
  void initState() {
    super.initState();
    final userService =
        UserServiceImpl(UserRepositoryImpl(KVSManager(), UserAPI()));
    final musicService = MusicServiceImpl(MusicRepositoryImpl(MusicAPI()));
    _playlistBloc =
        PlaylistBloc(userService: userService, musicService: musicService);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Playlist>>(
          stream: _playlistBloc.subject.stream,
          builder: (context, AsyncSnapshot<List<Playlist>> snapshot) {
            //var state = snapshot.data;
            return new Scaffold(
              body: new RefreshIndicator(
                onRefresh: _playlistBloc.getPlaylist(),
                child: new LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints boxConstraints) {
                  if (snapshot.data.isEmpty || snapshot.data == null) {
                    return new Center(
                      child: new CircularProgressIndicator(
                        backgroundColor: Colors.deepOrangeAccent,
                        strokeWidth: 5.0,
                      ),
                    );
                  } else {
                    if (snapshot.data.length > 0) {
                      return new ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            print("[DEBUG] snapshot");
                            print(snapshot.data[index].iconPath);
                            return Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.black38),
                                  ),
                                ),
                                child: ListTile(
                                  leading: new CircleAvatar(
                                    backgroundImage: new NetworkImage(
                                        snapshot.data[index].iconPath),
                                  ),
                                  title: Text(snapshot.data[index].name),
                                  subtitle:
                                      Text(snapshot.data[index].description),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => PlaylistDetail(
                                            snapshot.data[index].name),
                                      ),
                                    );
                                  },
                                ));
                          });
                    } else {
                      return new Center(
                        child: new Text("Empty data"),
                      );
                    }
                  }
                }),
              ),
            );
          }),
    );
  }
}
