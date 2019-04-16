import "package:clasick_flutter/domain/repository/UserRepository.dart";
import "package:clasick_flutter/interface/grpc/user_rpc.pbgrpc.dart";
import "package:clasick_flutter/interface/grpc/UserClient.dart";
import "package:clasick_flutter/domain/model/Login.dart";
import "package:clasick_flutter/interface/kvs/KVSManager.dart";

class UserRepositoryImpl implements UserRepository {
  UserClient _stub;
  KVSManager _kvs;
  UserRepositoryImpl(this._stub, this._kvs);

  @override
  Future<ResponseSignIn> signIn(RequestSignIn arg1) async {
    return await _stub.client.signIn(arg1);
  }

  @override
  Future<ResponseSignUp> signUp(RequestSignUp arg1) async{
    return await _stub.client.signUp(arg1);
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
  Future<bool> persistToken(AccessToken arg1) async {
    return _kvs.setToken(arg1);
  }
}