import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class PlaylistEvent extends Equatable {
  PlaylistEvent([List props = const []]) : super(props);
}

class NavigationBottomBarTapped extends PlaylistEvent {
  final int index;
  NavigationBottomBarTapped({
    @required this.index,
  }) : super([index]);

  String toString() => 'NavigationBottomBarTapped';
  int getIndex() => this.index;
}