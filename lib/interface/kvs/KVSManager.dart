import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

class KVSManager {
  // Create Singleton Object
  static KVSManager _instance;
  SharedPreferences client;
  factory KVSManager() {
    if (_instance == null) _instance = new KVSManager._internal();
    return _instance;
  }
  void initClient() async {
    client = await SharedPreferences.getInstance();
  }
  KVSManager._internal();
}