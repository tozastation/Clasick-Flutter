import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  SignUpEvent([List props = const []]) : super(props);
}

class SignUpButtonPressed extends SignUpEvent {
  final String username;
  final String password;

  SignUpButtonPressed({
    @required this.username,
    @required this.password,
  }) : super([username, password]);

  @override
  String toString() =>
      'SignUpButtonPressed { username: $username, password: $password }';
}
