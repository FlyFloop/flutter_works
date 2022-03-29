import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../repositories/user_repository.dart';

part 'bloc_signup_event.dart';
part 'bloc_signup_state.dart';

class BlocSignupBloc extends Bloc<BlocSignupEvent, SignupState> {
  UserRepository userRepository;

  BlocSignupBloc({required this.userRepository}) : super(SignupState.empty());

  @override
  SignupState get initialState => SignupState.empty();

  @override
  Stream<SignupState> mapEventToState(BlocSignupEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is SignupWithCredentialsPressed) {
      yield* _mapSignupWithCredentialsPressedToState(
        event.email,
        event.password,
      );
    }
  }

  Stream<SignupState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: email,
    );
  }

  Stream<SignupState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: password,
    );
  }

  Stream<SignupState> _mapSignupWithCredentialsPressedToState(
      String password, String email) async* {
    yield SignupState.loading();
    try {
      await userRepository.signUpWithEmailAndPassword(email, password);
      yield SignupState.success();
    } catch (e) {
      yield SignupState.failure();
    }
  }
}
