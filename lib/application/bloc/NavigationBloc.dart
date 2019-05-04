import 'package:rxdart/rxdart.dart';

enum Navigation { PLAYLIST, MY_MUSIC, SEARCH}

class NavigationBloc {
  final BehaviorSubject<Navigation> _navigationController = BehaviorSubject.seeded(Navigation.PLAYLIST);
  Observable<Navigation> get currentNavigationIndex => _navigationController.stream;
  void changeNavigationIndex(final Navigation option) => _navigationController.sink.add(option);
  void dispose() => _navigationController?.close();
}
