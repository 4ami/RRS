import 'package:restaurant/view/authentication/bloc/form_submission_status.dart';

class SignInState {
  final String username;
  final String password;
  final FormSubmissionStatus formStatus;

  SignInState({
    this.username = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  SignInState copyWith(
          {String? username, String? password, FormSubmissionStatus? status}) =>
      SignInState(
        username: username ?? this.username,
        password: password ?? this.password,
        formStatus: status ?? formStatus,
      );
}
