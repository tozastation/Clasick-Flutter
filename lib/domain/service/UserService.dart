import 'package:clasick_flutter/application/viewmodel/AccessToken.dart' as view;
import 'package:clasick_flutter/domain/model/Login.dart';
import "package:clasick_flutter/domain/repository/UserRepository.dart";
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/SignIn.dart';
import 'package:clasick_flutter/interface/grpc/user_rpc.pb.dart';
import 'dart:async';
import 'package:clasick_flutter/infrastructure/persistence/model/read/user/AccessToken.dart' as read;
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/AccessToken.dart' as write;

abstract class UserService {
  Future<read.AccessToken> signIn(LoginForm arg1);
  Future<bool> hasToken();
  Future<bool> deleteToken();
  Future<bool> persistToken(view.AccessToken arg1);
  Future<read.AccessToken> getToken();
}

class UserServiceImpl implements UserService {
  UserRepository _userRepository; // Interface
  UserServiceImpl(this._userRepository);

  @override
  Future<read.AccessToken> signIn(LoginForm arg1) async {
      print("Service Layer");
      final SignIn req = SignIn(name: arg1.userId.value, password: arg1.userPassword.value);
      final result = await _userRepository.signIn(req);
      return read.AccessToken(accessToken: result.accessToken);
  }

  @override
  Future<bool> hasToken() async {
      return await _userRepository.hasToken();
  }

  @override
  Future<bool> deleteToken() async {
    return await _userRepository.deleteToken();
  }

  @override
  Future<read.AccessToken> getToken() async {
    // TODO: implement getToken
    return await _userRepository.getToken();
  }

  @override
  Future<bool> persistToken(view.AccessToken accessToken) async {
    return await _userRepository.persistToken(write.AccessToken(accessToken: accessToken.value));
  }

  RequestSignIn _mappedToSign(LoginForm arg1) {
    var result = RequestSignIn();
    result.userName = arg1.userId.value;
    result.password = arg1.userPassword.value;
    return result;
  }
}