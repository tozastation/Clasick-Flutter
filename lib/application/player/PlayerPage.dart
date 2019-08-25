import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'PlayerWidget.dart';

// ignore: must_be_immutable
class PlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlayerPageState();
  }

  String title, artist, musicPath, iconPath;
  PlayerPage(String title, artist, musicPath, iconPath) {
    this.title = title;
    this.artist = artist;
    this.musicPath = musicPath;
    this.iconPath = iconPath;
  }
}

class _PlayerPageState extends State<PlayerPage> {
  AudioPlayer audioPlayer = new AudioPlayer();
  bool playing = true;
  Duration _position = new Duration();
  Duration _duration = new Duration();

  String milliToText(double time) {
    // ignore: unnecessary_statements
    final int min = ((time / 1000) / 60).floor();
    final int sec = (time / 1000).floor() % 60;
    if (sec < 10) {
      return min.toString() + ":0" + sec.toString();
    }
    return min.toString() + ":" + sec.toString();
  }

  void initPlayer() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFecd6c7), //Color(0xFFa39391),
        appBar: AppBar(
          title: Text("Music Player", style: TextStyle(color: Colors.white)),
          backgroundColor: Color(0xFFe79686),
        ),
        body: Center(
          child: PlayerWidget(
              url:
                  "https://storage.googleapis.com/clasick/music/1/ori_canon_in_d.mp3",
              artistName: widget.artist,
              musicName: widget.title,
              imagePath: widget.iconPath),
        ));
  }
}
