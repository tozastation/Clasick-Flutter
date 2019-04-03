import "package:clasick_flutter/domain/model/login.dart";
import "package:clasick_flutter/infrastructure/persistence/repository/UserRepositoryImpl.dart";

abstract class UserService {
  AccessToken signIn(LoginForm param);
}

class MixInUserService {
  final userService = new UserServiceImpl();
}

class UserServiceImpl with MixInUserRepository implements UserService {
  // Create Singleton Object
  static UserServiceImpl _instance;

  factory UserServiceImpl() {
    if (_instance == null) _instance = new UserServiceImpl._internal();
    return _instance;
  }

  UserServiceImpl._internal();

  UserRepositoryImpl _repository;

  @override
  // TODO: implement userRepository
  UserRepositoryImpl get userRepository => _repository;

  @override
  AccessToken signIn(LoginForm param) {
    final result = _repository.signIn(null);
    return null;
  }
}