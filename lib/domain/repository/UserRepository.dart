import "package:clasick_flutter/interface/grpc/user_rpc.pb.dart";

abstract class UserRepository {
  ResponseSignIn signIn(RequestSignIn param);
  ResponseSignUp signUp(RequestSignUp param);
}