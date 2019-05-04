import 'package:clasick_flutter/infrastructure/persistence/model/read/user/AccessToken.dart' as read;
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/AccessToken.dart' as write;
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
  Future<void> initClient() async {
    this.client = await SharedPreferences.getInstance();
  }

  Future<bool> initTokenIsExist() async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    return await client.setBool("HAS_TOKEN", false);
  }

  Future<bool> getTokenIsExist() async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    return client.getBool("HAS_TOKEN");
  }

  Future<bool> setToken(write.AccessToken value) async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    print("REGISTER TOKEN" + value.accessToken);
    final result = await client.setString("TOKEN", value.accessToken);
    print("REGISTER TOKEN RESULT" + result.toString());
    return result ? await client.setBool("HAS_TOKEN", true) : false;
  }

  Future<bool> deleteToken() async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    final result = await client.setString("TOKEN", "");
    return result ? await client.setBool("HAS_TOKEN", false) : false;
  }

  Future<read.AccessToken> getToken() async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    return read.AccessToken(accessToken: client.getString("TOKEN"));
  }

  KVSManager._internal();
}