import 'package:clasick_flutter/application/player/PlayerPage.dart';
import 'package:clasick_flutter/application/playlist_detail/PlaylistDetailBloc.dart';
import 'package:clasick_flutter/domain/model/Music.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlaylistDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlaylistDetailPage();
  }

  int playlistID;
  String playlistName;
  PlaylistDetailPage(int playlistID, String playlistName) {
    this.playlistID = playlistID;
    this.playlistName = playlistName;
  }
}

class _PlaylistDetailPage extends State<PlaylistDetailPage> {
  @override
  Widget build(BuildContext context) {
    PlaylistDetailBloc _playlistDetail = PlaylistDetailBloc(widget.playlistID);
    return Scaffold(
      backgroundColor: Color(0xFFecd6c7),
      appBar: AppBar(
        title: Text(widget.playlistName),
        backgroundColor: Color(0xFFe79686),
      ),
      body: RefreshIndicator(
        child: StreamBuilder<List<Music>>(
          stream: _playlistDetail.musicListStream,
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
                            backgroundImage: NetworkImage(
                                snapshot.data[index].iconPath ?? "Null Value"),
                          ),
                          title:
                              Text(snapshot.data[index].title ?? "Null Value"),
                          subtitle: Text(
                              snapshot.data[index].artistName ?? "Null Value"),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PlayerPage(
                                    snapshot.data[index].title ?? "Unknown",
                                    snapshot.data[index].artistName ??
                                        "Unknown",
                                    snapshot.data[index].musicPath ?? "Unknown",
                                    snapshot.data[index].iconPath ?? "Unknown"),
                              ),
                            );
                          }));
                },
              );
          },
        ),
        onRefresh: _playlistDetail.refreshPlaylist,
      ),
    );
  }
}
