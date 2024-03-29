import 'package:flutter/material.dart';
import 'package:clasick_flutter/screens/play.dart';

// ignore: must_be_immutable
class PlaylistDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlaylistDetail();
  }

  String playlistTitle;

  PlaylistDetail(String title) {
    this.playlistTitle = title;
  }
}


class _PlaylistDetail extends State<PlaylistDetail> {

  final musicTitles = [
    "カノン", "ピアノソナタ第1番 第一楽章 月光"
  ];

  final musicArtists = [
    "パッヘルベル", "ベートーヴェン"
  ];

  final musicIcons = [
    "https://blog-001.west.edge.storage-yahoo.jp/res/blog-13-d1/suurin0522/folder/385823/03/5621903/img_0",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Beethoven.jpg/1200px-Beethoven.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.playlistTitle),),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black38),
                ),
              ),
              child: ListTile(
                leading: new CircleAvatar(
                  backgroundImage: new NetworkImage(musicIcons[index]),
                ),
                title: Text(musicTitles[index]),
                subtitle: Text(musicArtists[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Play(musicTitles[index], musicArtists[index]),
                    ),
                  );
                },
              ));
        },
        itemCount: musicTitles.length,
      ),
    );
  }
}