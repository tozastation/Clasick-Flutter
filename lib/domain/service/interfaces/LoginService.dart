import 'package:clasick_flutter/domain/model/SignIn.dart';
import 'package:clasick_flutter/domain/model/SignUp.dart';

abstract class LoginService {
  Future<bool> signIn(SignIn request);
  Future<bool> signUp(SignUp request);
  Future<bool> signOut();
}