class UserID {
  String value = "";
  UserID(this.value);
}

class UserPassword {
  String value = "";
  UserPassword(this.value);
}

class LoginForm {
  UserID userId;
  UserPassword userPassword;
  LoginForm(this.userId, this.userPassword);
}