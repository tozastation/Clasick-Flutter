import 'dart:async';

import 'package:clasick_flutter/domain/model/Login.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:clasick_flutter/application/authentication/Authentication.dart';
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

      if (hasToken) {
        yield AuthenticationAuthenticated();
      } else {
        yield AuthenticationUnauthenticated();
      }
    }

    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userService.persistToken(AccessToken(event.token));
      yield AuthenticationAuthenticated();
    }

    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userService.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
