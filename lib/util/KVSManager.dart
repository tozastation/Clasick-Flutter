import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

// Static KVS Keys
class KVSKeys {
  static const String ALREADY_LOGIN = "ALREADY_LOGIN";
  static const String ACCESS_TOKEN = "ACCESS_TOKEN";
}

abstract class KVSManager {
  Future<void> initSharedPreference() ;
  Future<bool> getLoginState();
  Future<bool> setToken(String accessToken);
  Future<bool> deleteToken();
  Future<String> getToken();
}

class KVSManagerImpl implements KVSManager{
  static KVSManagerImpl _instance;
  SharedPreferences _client;

  factory KVSManagerImpl() {
    if (_instance == null) _instance = new KVSManagerImpl._internal();
    return _instance;
  }

  @override
  Future<void> initSharedPreference() async {
    this._client = await SharedPreferences.getInstance();
    final bool result = await this._client.setBool(KVSKeys.ALREADY_LOGIN, false);
    if (result == false){
      throw new Error();
    }
  }

  @override
  Future<bool> getLoginState() async {
    final result = this._client.getBool("HAS_TOKEN");
    return result == null ? result : false;
  }

  @override
  Future<bool> setToken(String accessToken) async {
    final result = await this._client.setString(KVSKeys.ACCESS_TOKEN, accessToken);
    return result ? await this._client.setBool(KVSKeys.ALREADY_LOGIN, true) : false;
  }

  @override
  Future<bool> deleteToken() async {
    final SharedPreferences client = await SharedPreferences.getInstance();
    final result = await client.setString(KVSKeys.ACCESS_TOKEN, null);
    return result ? await client.setBool(KVSKeys.ALREADY_LOGIN, false) : false;
  }

  @override
  Future<String> getToken() async {
    return this._client.getString("TOKEN");
  }

  KVSManagerImpl._internal();
}