abstract class SignInEvent {}

class SignInUsernameChange extends SignInEvent {
  final String username;
  SignInUsernameChange({required this.username});
}

class SignInPasswordChange extends SignInEvent {
  final String password;
  SignInPasswordChange({required this.password});
}

class SignInSubmitted extends SignInEvent {}
