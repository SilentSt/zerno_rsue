abstract class LoginState{}

class LoginLoadingState extends LoginState{}

class LoginLoadedState extends LoginState{}

class LoginSuccessState extends LoginState{}

class LoginErrorState extends LoginState{
  final String error;

  LoginErrorState(this.error);
}