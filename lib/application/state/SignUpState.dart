import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {
  SignUpState([List props = const []]) : super(props);
}

class SignUpInitial extends SignUpState {
  @override
  String toString() => 'SignUpInitial';
}

class SignUpLoading extends SignUpState {
  @override
  String toString() => 'SignUpLoading';
}

class SignUpFailure extends SignUpState {
  final String error;

  SignUpFailure({@required this.error}) : super([error]);

  @override
  String toString() => 'SignUpFailure { error: $error }';
}
