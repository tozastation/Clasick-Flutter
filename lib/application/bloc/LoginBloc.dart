import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:clasick_flutter/application/module/Login.dart';
import 'package:clasick_flutter/application/module/Authentication.dart';
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
        final token = await userService.signIn(LoginForm(UserID(event.password), UserPassword(event.password)));
        print(token.accessToken);
        authenticationBloc.dispatch(LoggedIn(token: token.accessToken));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
