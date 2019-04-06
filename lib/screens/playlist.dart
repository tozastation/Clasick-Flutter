import 'package:flutter/material.dart';
import 'package:clasick_flutter/screens/playlist_detail.dart';

class Playlist extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Playlist();
  }
}


class _Playlist extends State<Playlist> {

  var playlistTitle = [
    "ジム", "カラオケ", "お気に入り", "一次選考"
  ];

  var playlistComment = [
    "激しい系", "歌いたいリスト", "素直に好き", "好きになる可能性あり"
  ];

  var playlistIcon = [
    "https://nenemame-trend.info/wp-content/uploads/2018/05/yjimage.jpg",
    "https://pbs.twimg.com/profile_images/972392347454472192/iMMP8bCH_400x400.jpg",
    "https://info.dk311.jp/wp-content/uploads/2017/12/%E3%81%99%E3%81%93%E3%81%B6%E3%82%8B%E5%8B%95%E3%81%8F%E3%82%A6%E3%82%B5%E3%82%AE3GIF.gif",
    "http://dk311.jp/Extremely-Rabbit/cafe/img/common/usagi01.png"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Playlist'),),
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
                  backgroundImage: new NetworkImage(playlistIcon[index]),
                ),
                title: Text(playlistTitle[index]),
                subtitle: Text(playlistComment[index]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlaylistDetail(playlistTitle[index]),
                    ),
                  );
                },
              ));
        },
        itemCount: playlistTitle.length,
      ),
    );
  }
}