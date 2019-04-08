import 'package:flutter/material.dart';
import 'package:clasick_flutter/screens/login.dart';
import 'package:clasick_flutter/screens/home.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    Widget _defaultHome = Login();

    bool _result = false;
    if (_result) {
      _defaultHome = new Home();
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: _defaultHome,
//      routes: <String, WidgetBuilder>{
//        '/playlistDetail': (_) => PlaylistDetail(),
//      },
    );
  }
}