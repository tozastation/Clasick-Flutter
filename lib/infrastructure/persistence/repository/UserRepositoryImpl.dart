import "package:clasick_flutter/domain/repository/UserRepository.dart";
import 'package:clasick_flutter/infrastructure/persistence/model/read/user/AccessToken.dart' as read;
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/AccessToken.dart' as write;
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/SignIn.dart';
import 'package:clasick_flutter/infrastructure/persistence/model/write/user/SignUp.dart';
import 'package:clasick_flutter/interface/api/UserAPI.dart';
import "package:clasick_flutter/interface/kvs/KVSManager.dart";
import 'package:clasick_flutter/infrastructure/persistence/model/read/user/User.dart';

class UserRepositoryImpl implements UserRepository {
  //UserClient _stub;
  final KVSManager _kvs;
  final IUserAPI _userAPI;
  UserRepositoryImpl(this._kvs, this._userAPI);

  @override
  Future<User> getSingleUser(int userId) async {
    // TODO: implement getSingleUser
    return await _userAPI.getSingleUser(userId);
  }

  @override
  Future<read.AccessToken> signIn(SignIn value) async {
    return await _userAPI.signIn(value);
  }

  @override
  Future<read.AccessToken> signUp(SignUp value) async{
    return await _userAPI.signUp(value);
  }

  @override
  Future<bool> hasToken() async {
    return _kvs.getTokenIsExist();
  }

  @override
  Future<bool> deleteToken() async {
    return _kvs.getTokenIsExist();
  }

  @override
  Future<bool> persistToken(write.AccessToken arg1) async {
    return _kvs.setToken(arg1);
  }
}