import 'package:clasick_flutter/domain/service/MusicService.dart';
import 'package:clasick_flutter/domain/service/UserService.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/music/Playlist.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/AccessToken.dart' as write;
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class PlaylistBloc {

  final UserService userService;
  final IMusicService musicService;

  final BehaviorSubject<List<Playlist>> _subject = BehaviorSubject.seeded([]);

  PlaylistBloc({
    @required this.userService,
    @required this.musicService,
  })
      : assert(userService != null),
        assert(musicService != null);

  getPlaylist() async {
    final token  = await userService.getToken();
    final result = await musicService.getMyPlaylist(write.AccessToken(accessToken: token.accessToken));
    _subject.sink.add(result);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<Playlist>> get subject => _subject;
}