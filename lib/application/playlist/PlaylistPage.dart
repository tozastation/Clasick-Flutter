import 'package:clasick_flutter/application/playlist/PlaylistBloc.dart';
import 'package:clasick_flutter/application/playlist_detail/PlaylistDetailPage.dart';
import 'package:clasick_flutter/domain/model/Playlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class PlaylistPage extends StatelessWidget {
  PlaylistBloc playlist = PlaylistBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFecd6c7),
      appBar: AppBar(
        title: const Text(
          'Playlist',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFFe79686),
      ),
      body: RefreshIndicator(
        child: StreamBuilder<List<Playlist>>(
          stream: playlist.playlistStream,
          builder: (context, snapshot) {
            if (snapshot == null || snapshot.data == null)
              return Center(child: CircularProgressIndicator());
            else
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black38),
                        ),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data[index].iconPath),
                        ),
                        title: Text(snapshot.data[index].title),
                        subtitle: Text(snapshot.data[index].description),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PlaylistDetailPage(
                                  snapshot.data[index].id,
                                  snapshot.data[index].title),
                            ),
                          );
                        },
                      ));
                },
              );
          },
        ),
        onRefresh: playlist.refreshPlaylist,
      ),
    );
  }
}
