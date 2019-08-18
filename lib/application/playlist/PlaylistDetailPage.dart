//import 'package:clasick_flutter/application/player/PlayerPage.dart';
//import 'package:flutter/material.dart';
//
//// ignore: must_be_immutable
//class PlaylistDetailPage extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _PlaylistDetailPage();
//  }
//
//  String playlistTitle;
//
//  PlaylistDetailPage(String title) {
//    this.playlistTitle = title;
//  }
//}
//
//class _PlaylistDetailPage extends State<PlaylistDetailPage> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text(widget.playlistTitle),),
//      body: ListView.builder(
//        itemBuilder: (BuildContext context, int index) {
//          return Container(
//              decoration: BoxDecoration(
//                border: Border(
//                  bottom: BorderSide(color: Colors.black38),
//                ),
//              ),
//              child: ListTile(
//                leading: new CircleAvatar(
//                  backgroundImage: new NetworkImage(musicIcons[index]),
//                ),
//                title: Text(musicTitles[index]),
//                subtitle: Text(musicArtists[index]),
//                onTap: () {
//                  Navigator.push(
//                    context,
//                    MaterialPageRoute(
//                      builder: (context) => PlayerPage(musicTitles[index], musicArtists[index]),
//                    ),
//                  );
//                },
//              ));
//        },
//        itemCount: musicTitles.length,
//      ),
//    );
//  }
//}