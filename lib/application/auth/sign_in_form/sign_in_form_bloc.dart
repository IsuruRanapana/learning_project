import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learning_project/domain/auth/auth_failures.dart';
import 'package:learning_project/domain/auth/i_auth_facade.dart';
import 'package:learning_project/domain/auth/value_objects.dart';
import 'package:meta/meta.dart';
part 'sign_in_form_bloc.freezed.dart';

part 'sign_in_form_event.dart';

part 'sign_in_form_state.dart';

class SignInFormBloc extends Bloc<SignInFormEvent, SignInFormState> {
  final IAuthFacade _authFacade;

  SignInFormBloc(this._authFacade) : super(SignInFormState.initial()) {
    on<SignInFormEvent>((event, emit) {
      event.map(
        emailChanged: (e) async* {
          emit(state.copyWith(
            emailAddress: EmailAddress(e.emailString),
            authFailureOrSuccessOption: none(),
          ));
        },
        passwordChanged: (e) async* {
          emit(state.copyWith(
            password: Password(e.passwordString),
            authFailureOrSuccessOption: none(),
          ));
        },
        registerWithEmailAndPasswordPressed: (e) async* {
          late Either<AuthFailure, Unit> failureOrSuccess;
          final isEmailValid = state.emailAddress.isValid();
          final isPasswordValid = state.password.isValid();
          if (isEmailValid && isPasswordValid) {
            emit(state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ));
            failureOrSuccess = await _authFacade.registerWithEmailAndPassword(
                emailAddress: state.emailAddress, password: state.password);
          }

          emit(state.copyWith(
            showErrorMessages: true,
            authFailureOrSuccessOption: optionOf(failureOrSuccess),
          ));
        },
        signInWithEmailAndPasswordPressed: (e) async* {
          late Either<AuthFailure, Unit> failureOrSuccess;
          final isEmailValid = state.emailAddress.isValid();
          final isPasswordValid = state.password.isValid();
          if (isEmailValid && isPasswordValid) {
            emit(state.copyWith(
              isSubmitting: true,
              authFailureOrSuccessOption: none(),
            ));
            failureOrSuccess = await _authFacade.signInWithEmailAndPassword(
                emailAddress: state.emailAddress, password: state.password);
          }

          emit(state.copyWith(
            showErrorMessages: true,
            authFailureOrSuccessOption: optionOf(failureOrSuccess),
          ));
        },
        signInWithGooglePressed: (e) async* {
          emit(state.copyWith(
            isSubmitting: true,
            authFailureOrSuccessOption: none(),
          ));
          final failureOrSuccess = await _authFacade.signInWithGoogle();
          emit(state.copyWith(
            isSubmitting: false,
            authFailureOrSuccessOption: some(failureOrSuccess),
          ));
        },
      );
    });
  }
}
