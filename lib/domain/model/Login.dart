class UserID {
  String value = "";
  UserID(value) {
    this.value = value;
  }
}

class UserPassword {
  String value = "";
  UserPassword(value) {
    this.value = value;
  }
}

class LoginForm {
  UserID userId;
  UserPassword userPassword;
  LoginForm(arg1, arg2) {
    this.userId = arg1;
    this.userPassword = arg2;
  }
}