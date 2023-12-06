import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/data/repositories/auth_repo.dart';
import 'package:restaurant/view/authentication/bloc/form_submission_status.dart';
import 'package:restaurant/view/authentication/bloc/sign_in/sign_in_event.dart';
import 'package:restaurant/view/authentication/bloc/sign_in/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required this.repo}) : super(SignInState()) {
    on<SignInUsernameChange>(
        (event, emit) => emit(state.copyWith(username: event.username)));
    on<SignInPasswordChange>(
        (event, emit) => emit(state.copyWith(password: event.password)));
    on<SignInSubmitted>((event, emit) async {
      emit(state.copyWith(status: SubmittedFormStatus()));
      try {
        await repo.signIn();
        emit(state.copyWith(status: SubmissionSuccess()));
      } catch (error) {
        emit(
          state.copyWith(
            status: SubmissionFail(exception: error as Exception),
          ),
        );
      }
    });
  }
  final AuthRepository repo;
}
