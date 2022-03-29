import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tinder_clone/repositories/user_repository.dart';

import 'bloclogin_state.dart';

part 'bloclogin_event.dart';

class BlocloginBloc extends Bloc<BlocloginEvent, LoginState> {
  UserRepository userRepository;

  BlocloginBloc({required this.userRepository}) : super(LoginState.empty());

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<LoginState> mapEventToState(BlocloginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is LoginWithCredentialsPressed) {
      yield* _mapLoginWithCredentialsPressedToState(
        event.email,
        event.password,
      );
    }
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: email,
    );
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: password,
    );
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
      String password, String email) async* {
    yield LoginState.loading();
    try {
      await userRepository.signInWithEmailAndPassword(email, password);
      yield LoginState.success();
    } catch (e) {
      yield LoginState.failure();
    }
  }
}
