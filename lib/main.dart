import 'package:clasick_flutter/application/module/Home.dart';
import 'package:clasick_flutter/infrastructure/persistence/repository/UserRepositoryImpl.dart';
import 'package:clasick_flutter/interface/api/UserAPI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:clasick_flutter/application/module/Authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clasick_flutter/domain/service/UserService.dart';
import 'package:clasick_flutter/application/splash/Splash.dart';
import 'package:clasick_flutter/application/module/Login.dart';
import 'package:clasick_flutter/interface/kvs/KVSManager.dart';
import 'package:clasick_flutter/application/common/LoginIndicator.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

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

Future main() async {
  debugPaintSizeEnabled=false;
  await DotEnv().load('.env');
  BlocSupervisor().delegate = SimpleBlocDelegate();
  final _userRepoImpl = UserRepositoryImpl(KVSManager(), UserAPI());
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
              return HomeScreen();
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