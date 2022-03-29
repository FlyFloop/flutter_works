import 'package:meta/meta.dart';

//@immutable //all the fields are final
class LoginState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  LoginState(
      {required this.isEmailValid,
      required this.isPasswordValid,
      required this.isSubmitting,
      required this.isSuccess,
      required this.isFailure});

  //initial state
  factory LoginState.empty() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  factory LoginState.loading() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false);
  }
  factory LoginState.failure() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false);
  }
  factory LoginState.success() {
    return LoginState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false);
  }

  LoginState update({
    isEmailValid,
    isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  LoginState copyWith({
    isEmailValid,
    isPasswordValid,
    isSubmitting,
    isSuccess,
    isFailure,
  }) {
    return LoginState(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
    );
  }
}
