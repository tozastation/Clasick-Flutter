import 'dart:convert';
import 'package:clasick_flutter/infrastructure/persistence/model/read/user/AccessToken.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/SignIn.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/SignUp.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/read/user/User.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

abstract class IUserAPI {
  Future<AccessToken> signIn(SignIn value);
  Future<AccessToken> signUp(SignUp value);
  Future<User> getSingleUser(int userId);
}

class UserAPI implements IUserAPI {
  // Create Singleton Object
  static UserAPI _instance;
  final rootURL = "http://private-d3a9b2-clasick.apiary-mock.com"; //DotEnv().env['ROOT'];
  factory UserAPI() {
    if (_instance == null) _instance = new UserAPI._internal();
    return _instance;
  }
  UserAPI._internal();

  @override
  Future<User> getSingleUser(int userId) async {
    // TODO: implement getSingleUser
    final response = await http.get(rootURL + DotEnv().env['USER']);
    final user = User.fromJson(json.decode(response.body));
    return user;
  }

  @override
  Future<AccessToken> signIn(SignIn value) async {
    // TODO: implement signIn
    print("USER API Layer");
    print(json.encode(value));
    final response = await http.post(rootURL + "/login", body: json.encode(value));
    print(response.body);//DotEnv().env['LOGIN']
    final accessToken = AccessToken.fromJson(await json.decode(response.body));
    return accessToken;
  }

  @override
  Future<AccessToken> signUp(SignUp value) async {
    // TODO: implement signUp
    final response = await http.post(rootURL + DotEnv().env['GENRE'], body: json.encode(value));
    final accessToken = AccessToken.fromJson(json.decode(response.body));
    return accessToken;
  }
}