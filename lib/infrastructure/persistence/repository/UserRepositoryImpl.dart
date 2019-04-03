import "package:clasick_flutter/domain/repository/UserRepository.dart";
import "package:clasick_flutter/interface/grpc/user_rpc.pbgrpc.dart";

class MixInUserRepository {
  final userRepository = new UserRepositoryImpl();
}

class UserRepositoryImpl implements UserRepository {
  // Create Singleton Object
  static UserRepositoryImpl _instance;

  factory UserRepositoryImpl() {
    if (_instance == null) _instance = new UserRepositoryImpl._internal();
    return _instance;
  }

  UserRepositoryImpl._internal();

  @override
  ResponseSignIn signIn(RequestSignIn param) {
    // TODO: implement signIn
    return null;
  }

  @override
  ResponseSignUp signUp(RequestSignUp param) {
    // TODO: implement signUp
    return null;
  }
}