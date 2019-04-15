import 'package:clasick_flutter/domain/model/Login.dart';
import "package:clasick_flutter/interface/grpc/user_rpc.pb.dart";
import 'dart:async';

abstract class UserRepository {
  Future<ResponseSignIn> signIn(RequestSignIn arg1);
  Future<ResponseSignUp> signUp(RequestSignUp arg1);
  Future<bool> hasToken();
  Future<bool> deleteToken();
  Future<bool> persistToken(AccessToken arg1);
}