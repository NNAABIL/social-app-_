abstract class RegisterState {}

class RegisterInitState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {

}

class RegisterErrorState extends RegisterState {
  final String error;

  RegisterErrorState(this.error);
}

class CreateUserSuccessState extends RegisterState {

}

class CreateUserErrorState extends RegisterState {
  final String error;

  CreateUserErrorState(this.error);
}


class ChangeRegisterPasswordVisibility extends RegisterState{}
