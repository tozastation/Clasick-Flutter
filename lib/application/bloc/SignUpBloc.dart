import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:clasick_flutter/application/module/SignUp.dart';
import 'package:clasick_flutter/application/module/Authentication.dart';
import 'package:clasick_flutter/domain/service/UserService.dart';
import 'package:clasick_flutter/domain/model/Login.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserService userService;
  final AuthenticationBloc authenticationBloc;

  SignUpBloc({
    @required this.userService,
    @required this.authenticationBloc,
  })  : assert(userService != null),
        assert(authenticationBloc != null);

  @override
  SignUpState get initialState => SignUpInitial();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpButtonPressed) {
      yield SignUpLoading();

      try {
        final token = await userService.signIn(LoginForm(UserID(event.username), UserPassword(event.password)));
        authenticationBloc.dispatch(LoggedIn(token: token.accessToken));
        yield SignUpInitial();
      } catch (error) {
        yield SignUpFailure(error: error.toString());
      }
    }
  }
}
