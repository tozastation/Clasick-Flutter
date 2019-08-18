import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/domain/model/SignIn.dart';
import 'package:clasick_flutter/domain/model/SignUp.dart';
import 'package:clasick_flutter/domain/service/interfaces/LoginService.dart';
import 'package:rxdart/rxdart.dart';

enum LoginState { Already, NotReady, NetworkError}

class LoginBloc implements Bloc {
  LoginService _loginService;

  LoginBloc(LoginService loginSrv) {
    this._loginService = loginSrv;
  }

  final _loginStateController =
      BehaviorSubject<LoginState>.seeded(LoginState.Already);
  Stream<LoginState> get loginStream => _loginStateController.stream;

  void signIn(String userID, password) async {
    final bool onSuccess = await _loginService.signIn(SignIn(userID, password));
    if (onSuccess) {
      this._loginStateController.add(LoginState.Already);
    } else {
      this._loginStateController.add(LoginState.NetworkError);
    }
  }

  void signUp(String userID, password) async {
    final bool onSuccess = await this._loginService.signUp(SignUp(userID, password));
    if (onSuccess) {
      this._loginStateController.add(LoginState.Already);
    } else {
      this._loginStateController.add(LoginState.NetworkError);
    }
  }

  void signOut() async {
    final bool onSuccess = await this._loginService.signOut();
    if (onSuccess) {
      this._loginStateController.add(LoginState.NotReady);
    } else {
      this._loginStateController.add(LoginState.NetworkError);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _loginStateController.close();
  }
}
