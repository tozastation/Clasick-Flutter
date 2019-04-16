import 'package:clasick_flutter/infrastructure/persistence/repository/UserRepositoryImpl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:clasick_flutter/application/authentication/Authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clasick_flutter/domain/service/UserService.dart';
import 'package:clasick_flutter/application/splash/Splash.dart';
import 'package:clasick_flutter/application/login/Login.dart';
import 'package:clasick_flutter/interface/kvs/KVSManager.dart';
import 'package:clasick_flutter/interface/grpc/UserClient.dart';
import 'package:clasick_flutter/application/common/LoginIndicator.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print(error);
  }
}

void main() async {
  debugPaintSizeEnabled=true;
  BlocSupervisor().delegate = SimpleBlocDelegate();
  await KVSManager().initClient();
  await KVSManager().initTokenIsExist();
  final _userRepoImpl = UserRepositoryImpl(UserClient(), KVSManager());
  runApp(MyApp(userService: UserServiceImpl(_userRepoImpl)));
}

class MyApp extends StatefulWidget {
  final UserService userService;
  MyApp({Key key, @required this.userService}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthenticationBloc _authenticationBloc;
  UserServiceImpl get _userService => widget.userService;

  @override
  void initState() {
    _authenticationBloc = AuthenticationBloc(userService: _userService);
    _authenticationBloc.dispatch(AppStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
      bloc: _authenticationBloc,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is AuthenticationUninitialized) {
              return SplashPage();
            }
            if (state is AuthenticationAuthenticated) {
              //return HomePage();
            }
            if (state is AuthenticationUnauthenticated) {
              return LoginScreen(userService: _userService);
            }
            if (state is AuthenticationLoading) {
              return LoadingIndicator();
            }
          },
        ),
      ),
    );
  }
}