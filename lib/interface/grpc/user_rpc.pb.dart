///
//  Generated code. Do not modify.
//  source: user_rpc.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, Map, override;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user_rpc.pbenum.dart';

export 'user_rpc.pbenum.dart';

class RequestSignIn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('RequestSignIn', package: const $pb.PackageName('user'))
    ..aOS(1, 'userName')
    ..aOS(2, 'password')
    ..hasRequiredFields = false
  ;

  RequestSignIn() : super();
  RequestSignIn.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RequestSignIn.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RequestSignIn clone() => new RequestSignIn()..mergeFromMessage(this);
  RequestSignIn copyWith(void Function(RequestSignIn) updates) => super.copyWith((message) => updates(message as RequestSignIn));
  $pb.BuilderInfo get info_ => _i;
  static RequestSignIn create() => new RequestSignIn();
  RequestSignIn createEmptyInstance() => create();
  static $pb.PbList<RequestSignIn> createRepeated() => new $pb.PbList<RequestSignIn>();
  static RequestSignIn getDefault() => _defaultInstance ??= create()..freeze();
  static RequestSignIn _defaultInstance;

  String get userName => $_getS(0, '');
  set userName(String v) { $_setString(0, v); }
  bool hasUserName() => $_has(0);
  void clearUserName() => clearField(1);

  String get password => $_getS(1, '');
  set password(String v) { $_setString(1, v); }
  bool hasPassword() => $_has(1);
  void clearPassword() => clearField(2);
}

class ResponseSignIn extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ResponseSignIn', package: const $pb.PackageName('user'))
    ..aOS(1, 'accessToken')
    ..e<Result>(2, 'result', $pb.PbFieldType.OE, Result.SUCCESS, Result.valueOf, Result.values)
    ..hasRequiredFields = false
  ;

  ResponseSignIn() : super();
  ResponseSignIn.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ResponseSignIn.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ResponseSignIn clone() => new ResponseSignIn()..mergeFromMessage(this);
  ResponseSignIn copyWith(void Function(ResponseSignIn) updates) => super.copyWith((message) => updates(message as ResponseSignIn));
  $pb.BuilderInfo get info_ => _i;
  static ResponseSignIn create() => new ResponseSignIn();
  ResponseSignIn createEmptyInstance() => create();
  static $pb.PbList<ResponseSignIn> createRepeated() => new $pb.PbList<ResponseSignIn>();
  static ResponseSignIn getDefault() => _defaultInstance ??= create()..freeze();
  static ResponseSignIn _defaultInstance;

  String get accessToken => $_getS(0, '');
  set accessToken(String v) { $_setString(0, v); }
  bool hasAccessToken() => $_has(0);
  void clearAccessToken() => clearField(1);

  Result get result => $_getN(1);
  set result(Result v) { setField(2, v); }
  bool hasResult() => $_has(1);
  void clearResult() => clearField(2);
}

class RequestSignUp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('RequestSignUp', package: const $pb.PackageName('user'))
    ..aOS(1, 'userName')
    ..aOS(2, 'password')
    ..e<Result>(3, 'result', $pb.PbFieldType.OE, Result.SUCCESS, Result.valueOf, Result.values)
    ..hasRequiredFields = false
  ;

  RequestSignUp() : super();
  RequestSignUp.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RequestSignUp.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RequestSignUp clone() => new RequestSignUp()..mergeFromMessage(this);
  RequestSignUp copyWith(void Function(RequestSignUp) updates) => super.copyWith((message) => updates(message as RequestSignUp));
  $pb.BuilderInfo get info_ => _i;
  static RequestSignUp create() => new RequestSignUp();
  RequestSignUp createEmptyInstance() => create();
  static $pb.PbList<RequestSignUp> createRepeated() => new $pb.PbList<RequestSignUp>();
  static RequestSignUp getDefault() => _defaultInstance ??= create()..freeze();
  static RequestSignUp _defaultInstance;

  String get userName => $_getS(0, '');
  set userName(String v) { $_setString(0, v); }
  bool hasUserName() => $_has(0);
  void clearUserName() => clearField(1);

  String get password => $_getS(1, '');
  set password(String v) { $_setString(1, v); }
  bool hasPassword() => $_has(1);
  void clearPassword() => clearField(2);

  Result get result => $_getN(2);
  set result(Result v) { setField(3, v); }
  bool hasResult() => $_has(2);
  void clearResult() => clearField(3);
}

class ResponseSignUp extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ResponseSignUp', package: const $pb.PackageName('user'))
    ..aOS(1, 'accessToken')
    ..e<Result>(2, 'result', $pb.PbFieldType.OE, Result.SUCCESS, Result.valueOf, Result.values)
    ..hasRequiredFields = false
  ;

  ResponseSignUp() : super();
  ResponseSignUp.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ResponseSignUp.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ResponseSignUp clone() => new ResponseSignUp()..mergeFromMessage(this);
  ResponseSignUp copyWith(void Function(ResponseSignUp) updates) => super.copyWith((message) => updates(message as ResponseSignUp));
  $pb.BuilderInfo get info_ => _i;
  static ResponseSignUp create() => new ResponseSignUp();
  ResponseSignUp createEmptyInstance() => create();
  static $pb.PbList<ResponseSignUp> createRepeated() => new $pb.PbList<ResponseSignUp>();
  static ResponseSignUp getDefault() => _defaultInstance ??= create()..freeze();
  static ResponseSignUp _defaultInstance;

  String get accessToken => $_getS(0, '');
  set accessToken(String v) { $_setString(0, v); }
  bool hasAccessToken() => $_has(0);
  void clearAccessToken() => clearField(1);

  Result get result => $_getN(1);
  set result(Result v) { setField(2, v); }
  bool hasResult() => $_has(1);
  void clearResult() => clearField(2);
}

class ResponseUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ResponseUser', package: const $pb.PackageName('user'))
    ..a<int>(1, 'userId', $pb.PbFieldType.O3)
    ..aOS(2, 'userName')
    ..hasRequiredFields = false
  ;

  ResponseUser() : super();
  ResponseUser.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ResponseUser.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ResponseUser clone() => new ResponseUser()..mergeFromMessage(this);
  ResponseUser copyWith(void Function(ResponseUser) updates) => super.copyWith((message) => updates(message as ResponseUser));
  $pb.BuilderInfo get info_ => _i;
  static ResponseUser create() => new ResponseUser();
  ResponseUser createEmptyInstance() => create();
  static $pb.PbList<ResponseUser> createRepeated() => new $pb.PbList<ResponseUser>();
  static ResponseUser getDefault() => _defaultInstance ??= create()..freeze();
  static ResponseUser _defaultInstance;

  int get userId => $_get(0, 0);
  set userId(int v) { $_setSignedInt32(0, v); }
  bool hasUserId() => $_has(0);
  void clearUserId() => clearField(1);

  String get userName => $_getS(1, '');
  set userName(String v) { $_setString(1, v); }
  bool hasUserName() => $_has(1);
  void clearUserName() => clearField(2);
}

class RequestGetSingleUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('RequestGetSingleUser', package: const $pb.PackageName('user'))
    ..a<int>(1, 'userId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  RequestGetSingleUser() : super();
  RequestGetSingleUser.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  RequestGetSingleUser.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  RequestGetSingleUser clone() => new RequestGetSingleUser()..mergeFromMessage(this);
  RequestGetSingleUser copyWith(void Function(RequestGetSingleUser) updates) => super.copyWith((message) => updates(message as RequestGetSingleUser));
  $pb.BuilderInfo get info_ => _i;
  static RequestGetSingleUser create() => new RequestGetSingleUser();
  RequestGetSingleUser createEmptyInstance() => create();
  static $pb.PbList<RequestGetSingleUser> createRepeated() => new $pb.PbList<RequestGetSingleUser>();
  static RequestGetSingleUser getDefault() => _defaultInstance ??= create()..freeze();
  static RequestGetSingleUser _defaultInstance;

  int get userId => $_get(0, 0);
  set userId(int v) { $_setSignedInt32(0, v); }
  bool hasUserId() => $_has(0);
  void clearUserId() => clearField(1);
}

class ResponseGetSingleUser extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('ResponseGetSingleUser', package: const $pb.PackageName('user'))
    ..a<ResponseUser>(1, 'user', $pb.PbFieldType.OM, ResponseUser.getDefault, ResponseUser.create)
    ..e<Result>(2, 'result', $pb.PbFieldType.OE, Result.SUCCESS, Result.valueOf, Result.values)
    ..hasRequiredFields = false
  ;

  ResponseGetSingleUser() : super();
  ResponseGetSingleUser.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  ResponseGetSingleUser.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  ResponseGetSingleUser clone() => new ResponseGetSingleUser()..mergeFromMessage(this);
  ResponseGetSingleUser copyWith(void Function(ResponseGetSingleUser) updates) => super.copyWith((message) => updates(message as ResponseGetSingleUser));
  $pb.BuilderInfo get info_ => _i;
  static ResponseGetSingleUser create() => new ResponseGetSingleUser();
  ResponseGetSingleUser createEmptyInstance() => create();
  static $pb.PbList<ResponseGetSingleUser> createRepeated() => new $pb.PbList<ResponseGetSingleUser>();
  static ResponseGetSingleUser getDefault() => _defaultInstance ??= create()..freeze();
  static ResponseGetSingleUser _defaultInstance;

  ResponseUser get user => $_getN(0);
  set user(ResponseUser v) { setField(1, v); }
  bool hasUser() => $_has(0);
  void clearUser() => clearField(1);

  Result get result => $_getN(1);
  set result(Result v) { setField(2, v); }
  bool hasResult() => $_has(1);
  void clearResult() => clearField(2);
}

