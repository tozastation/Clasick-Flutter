import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum PlayerState { stopped, playing, paused }

class PlayerWidget extends StatefulWidget {
  final String url, artistName, musicName, imagePath;
  final bool isLocal;
  final PlayerMode mode;

  PlayerWidget(
      {@required this.url,
      @required this.artistName,
      @required this.musicName,
      @required this.imagePath,
      this.isLocal = false,
      this.mode = PlayerMode.MEDIA_PLAYER});

  @override
  State<StatefulWidget> createState() {
    return new _PlayerWidgetState(
        url, artistName, musicName, imagePath, isLocal, mode);
  }
}

class _PlayerWidgetState extends State<PlayerWidget> {
  String url, artistName, musicName, imagePath;
  bool isLocal;
  PlayerMode mode;

  AudioPlayer _audioPlayer;
  AudioPlayerState _audioPlayerState;
  Duration _duration;
  Duration _position;

  PlayerState _playerState = PlayerState.stopped;
  StreamSubscription _durationSubscription;
  StreamSubscription _positionSubscription;
  StreamSubscription _playerCompleteSubscription;
  StreamSubscription _playerErrorSubscription;
  StreamSubscription _playerStateSubscription;

  get _isPlaying => _playerState == PlayerState.playing;
  get _isPaused => _playerState == PlayerState.paused;
  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';

  _PlayerWidgetState(this.url, this.artistName, this.musicName, this.imagePath,
      this.isLocal, this.mode);

  @override
  void initState() {
    super.initState();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.stop();
    _durationSubscription?.cancel();
    _positionSubscription?.cancel();
    _playerCompleteSubscription?.cancel();
    _playerErrorSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: SizedBox(
            width: 250.0,
            height: 250.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Image.network(this.imagePath, fit: BoxFit.fill),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 60, 0, 0),
          child: Text(
            this.musicName,
            style: TextStyle(
              fontSize: 20.0,
              color: Color(0xFFa39391),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Text(
            this.artistName,
            style: TextStyle(
              color: Color(0xFFa39391),
            ),
          ),
        ),
        Container(
            child: Slider(
          activeColor: Color(0xFFa39391),
          inactiveColor: Colors.grey,
          onChanged: (double value) {},
          value: (_position != null &&
                  _duration != null &&
                  _position.inMilliseconds > 0 &&
                  _position.inMilliseconds < _duration.inMilliseconds)
              ? _position.inMilliseconds / _duration.inMilliseconds
              : 0.0,
        )),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new IconButton(
                onPressed: _isPlaying ? null : () => _play(),
                iconSize: 45.0,
                icon: new Icon(Icons.skip_previous),
                color: Color(0xFFa39391)),
            new IconButton(
                onPressed: _isPlaying ? () => _pause() : () => _play(),
                iconSize: 64.0,
                icon:
                    _isPlaying ? new Icon(Icons.pause) : Icon(Icons.play_arrow),
                color: Color(0xFFa39391)),
            new IconButton(
                onPressed: _isPlaying || _isPaused ? () => _stop() : null,
                iconSize: 45.0,
                icon: new Icon(Icons.skip_next),
                color: Color(0xFFa39391)),
          ],
        ),
        new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Text(
              _position != null
                  ? '${_positionText ?? ''} / ${_durationText ?? ''}'
                  : _duration != null ? _durationText : '',
              style: new TextStyle(fontSize: 24.0, color: Color(0xFFa39391)),
            ),
          ],
        ),
        new Text(
          "State: $_audioPlayerState",
          style: TextStyle(color: Color(0xFFa39391)),
        )
      ],
    );
  }

  void _initAudioPlayer() {
    _audioPlayer = AudioPlayer(mode: mode);

    _durationSubscription =
        _audioPlayer.onDurationChanged.listen((duration) => setState(() {
              _duration = duration;
            }));

    _positionSubscription =
        _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
              _position = p;
            }));

    _playerCompleteSubscription =
        _audioPlayer.onPlayerCompletion.listen((event) {
      _onComplete();
      setState(() {
        _position = _duration;
      });
    });

    _playerErrorSubscription = _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });

    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {
        _audioPlayerState = state;
      });
    });
  }

  Future<int> _play() async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;
    final result =
        await _audioPlayer.play(url, isLocal: isLocal, position: playPosition);
    if (result == 1) setState(() => _playerState = PlayerState.playing);
    return result;
  }

  Future<int> _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) setState(() => _playerState = PlayerState.paused);
    return result;
  }

  Future<int> _stop() async {
    final result = await _audioPlayer.stop();
    if (result == 1) {
      setState(() {
        _playerState = PlayerState.stopped;
        _position = Duration();
      });
    }
    return result;
  }

  void _onComplete() {
    setState(() => _playerState = PlayerState.stopped);
  }
}
