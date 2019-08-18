import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

// ignore: must_be_immutable
class PlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PlayerPageState();
  }

  String title;
  String artist;
  PlayerPage(String title, String artist) {
    this.title = title;
    this.artist = artist;
  }
}

class _PlayerPageState extends State<PlayerPage> {
  AudioPlayer audioPlayer = new AudioPlayer();
  String _url = "https://storage.googleapis.com/clasick/1/canon-index.m3u8";

  bool playing = false;
  Duration _position = new Duration();
  Duration _duration = new Duration();

  play() async {
    int result = await audioPlayer.play(_url);
    if (result == 1) {
      print("SUCCESS Playing");
    }
  }

  pause() async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      print("SUCCESS Pause");
    }
  }

  resume() async {
    int result = await audioPlayer.resume();
    if (result == 1) {
      print("SUCCESS Resume");
    }
  }

  String milliToText(double time) {
    // ignore: unnecessary_statements
    final int min = ((time/1000) / 60).floor();
    final int sec = (time/1000).floor() % 60;
    if (sec < 10) {
      return min.toString() + ":0" +  sec.toString();
    }
    return min.toString() + ":" +  sec.toString();
  }

  void initPlayer(){
    audioPlayer.onDurationChanged.listen(
            (value) {
          setState(() {
            _duration = value;
          });
        }
    );

    audioPlayer.onAudioPositionChanged.listen(
            (value) {
          setState(() {
            _position = value;
          });
        }
    );
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose() {
    pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlist'),
      ),
      body: Center(
          child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: SizedBox(
                    width: 300.0,
                    height: 300.0,
                    child: Image.network(
                        'http://harucla.cocolog-nifty.com/photos/uncategorized/2012/05/14/img_143402_8722050_3_2.jpg'),
                  ),
                ),
                Container(child: Slider(
                  value: _position.inMilliseconds.toDouble(),
                  min: 0.0,
                  max: _duration.inMilliseconds.toDouble(),
                  onChanged: null,
                )),
                Row(children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0.0),
                      child: Text(
                        milliToText( _position.inMilliseconds.toDouble()),
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0.0),
                      child: Text(
                        milliToText(_duration.inMilliseconds.toDouble()),
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Text(
                    widget.artist,
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ])),
      floatingActionButton: Row(children: <Widget>[
        Expanded(
            child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 100.0),
                child: FloatingActionButton(
                  heroTag: "Previous",
                  onPressed: () {},
                  child: Icon(Icons.skip_previous),
                ))),
        Expanded(
          child: Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 100.0),
              child: FloatingActionButton(
                  heroTag: "Play/Pause",
                  onPressed: () {
                    if (audioPlayer.state == AudioPlayerState.PLAYING) {
                      pause();
                      setState(() {
                        playing = false;
                      });
                    } else if (audioPlayer.state == AudioPlayerState.PAUSED) {
                      resume();
                      setState(() {
                        playing = true;
                      });
                    } else {
                      play();
                      setState(() {
                        playing = true;
                      });
                    }
                  },
                  child: playing
                      ? new Icon(Icons.pause)
                      : new Icon(Icons.play_arrow))),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 100.0),
            child: FloatingActionButton(
              heroTag: "Next",
              onPressed: () {},
              child: Icon(Icons.skip_next),
            ),
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
