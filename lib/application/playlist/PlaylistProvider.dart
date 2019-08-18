import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/application/playlist/PlaylistBloc.dart';
import 'package:flutter/widgets.dart';

@immutable
class PlaylistProvider extends BlocProvider<PlaylistBloc> {
  PlaylistProvider({
    Widget child,
  }) : super(
    creator: (context, _bag) => PlaylistBloc(),
    child: child,
  );
  static PlaylistBloc of(BuildContext context) => BlocProvider.of(context);
}
