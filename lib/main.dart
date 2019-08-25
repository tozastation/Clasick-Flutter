import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/application/home/HomePage.dart';
import 'package:clasick_flutter/application/login/LoginBloc.dart';
import 'package:clasick_flutter/domain/service/LoginServiceImpl.dart';
import 'package:clasick_flutter/domain/service/interfaces/LoginService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'application/playlist/PlaylistProvider.dart';

Future main() async {
  debugPaintSizeEnabled = false;
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    LoginService loginService = LoginServiceImpl();
    _loginBloc = LoginBloc(loginService);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: [PlaylistProvider()],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: StreamBuilder<LoginState>(
          stream: _loginBloc.loginStream,
          initialData: LoginState.Already,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<LoginState> snapshot) {
            switch (snapshot.data) {
              case LoginState.Already:
                return HomePage();
              case LoginState.NotReady:
                return Container();
              case LoginState.NetworkError:
                return Container();
            }
          },
        ),
      ),
    );
  }
}
