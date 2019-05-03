import 'package:clasick_flutter/infrastructure/persistence/model/write/user/AccessToken.dart';
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
    return client.setBool("HAS_TOKEN", false);
  }

  Future<bool> getTokenIsExist() async {
    return client.getBool("HAS_TOKEN");
  }

  Future<bool> setToken(AccessToken value) async {
    final result = await client.setString("TOKEN", value.accessToken);
    return result ? false : client.setBool("HAS_TOKEN", true);
  }

  Future<bool> deleteToken() async {
    final result = await client.setString("TOKEN", "");
    return result ? false : client.setBool("HAS_TOKEN", false);
  }

  KVSManager._internal();
}