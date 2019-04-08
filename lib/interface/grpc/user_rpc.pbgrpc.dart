///
//  Generated code. Do not modify.
//  source: user_rpc.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

import 'dart:async' as $async;

import 'package:grpc/service_api.dart' as $grpc;
import 'user_rpc.pb.dart';
export 'user_rpc.pb.dart';

class UserRpcClient extends $grpc.Client {
  static final _$signIn = new $grpc.ClientMethod<RequestSignIn, ResponseSignIn>(
      '/user.UserRpc/SignIn',
      (RequestSignIn value) => value.writeToBuffer(),
      (List<int> value) => new ResponseSignIn.fromBuffer(value));
  static final _$signUp = new $grpc.ClientMethod<RequestSignUp, ResponseSignUp>(
      '/user.UserRpc/SignUp',
      (RequestSignUp value) => value.writeToBuffer(),
      (List<int> value) => new ResponseSignUp.fromBuffer(value));
  static final _$getSingleUser =
      new $grpc.ClientMethod<RequestGetSingleUser, ResponseGetSingleUser>(
          '/user.UserRpc/GetSingleUser',
          (RequestGetSingleUser value) => value.writeToBuffer(),
          (List<int> value) => new ResponseGetSingleUser.fromBuffer(value));

  UserRpcClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<ResponseSignIn> signIn(RequestSignIn request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$signIn, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<ResponseSignUp> signUp(RequestSignUp request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$signUp, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<ResponseGetSingleUser> getSingleUser(
      RequestGetSingleUser request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getSingleUser, new $async.Stream.fromIterable([request]),
        options: options);
    return new $grpc.ResponseFuture(call);
  }
}

abstract class UserRpcServiceBase extends $grpc.Service {
  String get $name => 'user.UserRpc';

  UserRpcServiceBase() {
    $addMethod(new $grpc.ServiceMethod<RequestSignIn, ResponseSignIn>(
        'SignIn',
        signIn_Pre,
        false,
        false,
        (List<int> value) => new RequestSignIn.fromBuffer(value),
        (ResponseSignIn value) => value.writeToBuffer()));
    $addMethod(new $grpc.ServiceMethod<RequestSignUp, ResponseSignUp>(
        'SignUp',
        signUp_Pre,
        false,
        false,
        (List<int> value) => new RequestSignUp.fromBuffer(value),
        (ResponseSignUp value) => value.writeToBuffer()));
    $addMethod(
        new $grpc.ServiceMethod<RequestGetSingleUser, ResponseGetSingleUser>(
            'GetSingleUser',
            getSingleUser_Pre,
            false,
            false,
            (List<int> value) => new RequestGetSingleUser.fromBuffer(value),
            (ResponseGetSingleUser value) => value.writeToBuffer()));
  }

  $async.Future<ResponseSignIn> signIn_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return signIn(call, await request);
  }

  $async.Future<ResponseSignUp> signUp_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return signUp(call, await request);
  }

  $async.Future<ResponseGetSingleUser> getSingleUser_Pre(
      $grpc.ServiceCall call, $async.Future request) async {
    return getSingleUser(call, await request);
  }

  $async.Future<ResponseSignIn> signIn(
      $grpc.ServiceCall call, RequestSignIn request);
  $async.Future<ResponseSignUp> signUp(
      $grpc.ServiceCall call, RequestSignUp request);
  $async.Future<ResponseGetSingleUser> getSingleUser(
      $grpc.ServiceCall call, RequestGetSingleUser request);
}
