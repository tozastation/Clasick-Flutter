import "package:clasick_flutter/domain/model/Login.dart";
import "package:clasick_flutter/domain/repository/UserRepository.dart";
import 'package:clasick_flutter/interface/grpc/user_rpc.pb.dart';
import 'dart:async';

abstract class UserService {
  Future<AccessToken> signIn(LoginForm arg1);
  Future<bool> hasToken();
  Future<bool> deleteToken();
  Future<bool> persistToken(AccessToken arg1);
}

class UserServiceImpl implements UserService {
  UserRepository _userRepository; // Interface
  UserServiceImpl(this._userRepository);

  @override
  Future<AccessToken> signIn(LoginForm arg1) async {
      final result = await _userRepository.signIn(_mappedToSign(arg1));
      return AccessToken(result.accessToken);
  }
  @override
  Future<bool> hasToken() async {
      return await _userRepository.hasToken();
  }

  @override
  Future<bool> deleteToken() async {
    return _userRepository.deleteToken();
  }

  @override
  Future<bool> persistToken(AccessToken arg1) async {
    return _userRepository.persistToken(arg1);
  }
  RequestSignIn _mappedToSign(LoginForm arg1) {
    var result = RequestSignIn();
    result.userName = arg1.userId.value;
    result.password = arg1.userPassword.value;
    return result;
  }
}