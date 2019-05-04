import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clasick_flutter/application/module/Authentication.dart';
import 'package:clasick_flutter/application/module/Login.dart';

class LoginContainer extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthenticationBloc authenticationBloc;

  LoginContainer({
    Key key,
    @required this.loginBloc,
    @required this.authenticationBloc,
  }) : super(key: key);

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return Container(
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          child: new Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: new TextFormField(
                  controller: _usernameCtrl,
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      labelText: 'User Name',
                      hintText: 'Please enter a search term'),
                ),
              ),
              new Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: new TextFormField(
                  controller: _passwordCtrl,
                  decoration: InputDecoration(
                      border: new OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.teal)),
                      labelText: 'Password',
                      hintText: 'Please enter a search term'),
                ),
              ),
              new Container(
                  margin: const EdgeInsets.all(4.0),
                  child: ButtonTheme(
                    minWidth: 80.0,
                    height: 40.0,
                    child: new RaisedButton(
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(),
                      onPressed:
                          state is! LoginLoading ? _onLoginButtonPressed : null,
                    ),
                  )),
              Container(
                child: ButtonTheme(
                  minWidth: 80.0,
                  height: 40.0,
                  child: new RaisedButton(
                    child: const Text(
                      'SignUp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    color: Colors.green,
                    shape: RoundedRectangleBorder(),
                    onPressed:
                        state is! LoginLoading ? _onLoginButtonPressed : null,
                  ),
                ),
              ),
              Container(
                child:
                    state is LoginLoading ? CircularProgressIndicator() : null,
              ),
            ],
          ),
        );
      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameCtrl.text,
      password: _passwordCtrl.text,
    ));
  }
}
