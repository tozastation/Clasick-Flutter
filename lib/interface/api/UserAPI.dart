import 'dart:convert';
import 'package:clasick_flutter/infrastructure/persistence/model/read/user/AccessToken.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/SignIn.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/SignUp.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/user/User.dart';
import 'package:http/http.dart' as http;
import 'package:dotenv/dotenv.dart';

abstract class IUserAPI {
  Future<AccessToken> signIn(SignIn value);
  Future<AccessToken> signUp(SignUp value);
  Future<User> getSingleUser(int userId);
}

class UserAPI implements IUserAPI {
  // Create Singleton Object
  static UserAPI _instance;
  final rootURL = env['ROOT_PATH'];
  factory UserAPI() {
    if (_instance == null) _instance = new UserAPI._internal();
    return _instance;
  }
  UserAPI._internal();

  @override
  Future<User> getSingleUser(int userId) async {
    // TODO: implement getSingleUser
    final response = await http.get(rootURL + env['GENRE']);
    final user = User.fromJson(json.decode(response.body));
    return user;
  }

  @override
  Future<AccessToken> signIn(SignIn value) async {
    // TODO: implement signIn
    final response = await http.post(rootURL + env['GENRE'], body: json.encode(value));
    final accessToken = AccessToken.fromJson(json.decode(response.body));
    return accessToken;
  }

  @override
  Future<AccessToken> signUp(SignUp value) async {
    // TODO: implement signUp
    final response = await http.post(rootURL + env['GENRE'], body: json.encode(value));
    final accessToken = AccessToken.fromJson(json.decode(response.body));
    return accessToken;
  }
}