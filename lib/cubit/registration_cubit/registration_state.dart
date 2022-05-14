abstract class RegistrationState {}

class RegistrationLoadingState extends RegistrationState{}

class RegistrationLoadedState extends RegistrationState{}

class RegistrationSuccessState extends RegistrationState{}

class RegistrationErrorState extends RegistrationState{
  final String error;

  RegistrationErrorState(this.error);
}