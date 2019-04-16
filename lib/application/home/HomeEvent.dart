import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class HomeEvent extends Equatable {
  HomeEvent([List props = const []]) : super(props);
}

class NavigationBottomBarTapped extends HomeEvent {
  final int index;
  NavigationBottomBarTapped({
    @required this.index,
  }) : super([index]);

  String toString() => 'NavigationBottomBarTapped';
  int getIndex() => this.index;
}