import 'dart:async';
import 'package:clasick_flutter/application/viewmodel/AccessToken.dart' as view;
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:clasick_flutter/application/module/Authentication.dart';
import 'package:clasick_flutter/domain/service/UserService.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserService userService;

  AuthenticationBloc({@required this.userService})
      : assert(userService != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event,
      ) async* {
    if (event is AppStarted) {
      final bool hasToken = await userService.hasToken();
      print("確認");
      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      final result = await userService.persistToken(view.AccessToken(event.token));
      print(result);
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userService.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
