
import 'package:clasick_flutter/application/state/PlaylistState.dart';
import 'package:clasick_flutter/domain/service/MusicService.dart';
import 'package:clasick_flutter/domain/service/UserService.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/AccessToken.dart';
import 'package:clasick_flutter/interface/api/MusicAPI.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class PlaylistBloc {
  final Stream<PlaylistState> state;


  static Stream<PlaylistState> _loading(UserService userService, IMusicService musicService) async* {
      yield PlaylistLoading();
      try {
        final accessToken = await userService.getToken();
        final result = await musicService.getAllPlaylist(AccessToken(accessToken: accessToken.accessToken));
        if (result.isEmpty) {
          yield PlaylistEmpty();
        } else {
          yield PlaylistResult(result);
        }
      } catch (e) {
        yield PlaylistError();
      }
    }
  }
}