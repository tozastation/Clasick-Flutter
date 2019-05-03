import 'package:clasick_flutter/infrastructure/persistence/model/read/user/AccessToken.dart' as read;
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/AccessToken.dart' as write;
import 'package:clasick_flutter/infrastructure/persistence/model/read/user/User.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/SignIn.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/SignUp.dart';
import 'dart:async';

abstract class UserRepository {
  Future<read.AccessToken> signIn(SignIn value);
  Future<read.AccessToken> signUp(SignUp value);
  Future<User> getSingleUser(int userId);
  Future<bool> hasToken();
  Future<bool> deleteToken();
  Future<bool> persistToken(write.AccessToken value);
}