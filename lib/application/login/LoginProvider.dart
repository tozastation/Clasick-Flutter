import 'package:bloc_provider/bloc_provider.dart';
import 'package:clasick_flutter/application/playlist/PlaylistBloc.dart';
import 'package:clasick_flutter/domain/service/interfaces/LoginService.dart';
import 'package:flutter/widgets.dart';

import 'LoginBloc.dart';

@immutable
class LoginProvider extends BlocProvider<LoginBloc> {
  LoginProvider({
    Widget child,
    LoginService loginService,
  }) : super(
    creator: (context, _bag) => LoginBloc(loginService),
    child: child,
  );
  static LoginBloc of(BuildContext context) => BlocProvider.of(context);
}