import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:clasick_flutter/application/login/Login.dart';
import 'package:clasick_flutter/application/authentication/Authentication.dart';
import 'package:clasick_flutter/domain/service/UserService.dart';
import 'package:clasick_flutter/domain/model/Login.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserService userService;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userService,
    @required this.authenticationBloc,
  })  : assert(userService != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userService.signIn(
          LoginForm(
              event.username,
              event.password
          )
        );

        authenticationBloc.dispatch(LoggedIn(token: token.value));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
