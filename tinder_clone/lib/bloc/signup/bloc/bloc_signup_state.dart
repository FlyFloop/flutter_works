part of 'bloc_signup_bloc.dart';

//@immutable //all the fields are final
class SignupState {
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isEmailValid && isPasswordValid;

  SignupState(
      {required this.isEmailValid,
      required this.isPasswordValid,
      required this.isSubmitting,
      required this.isSuccess,
      required this.isFailure});

  //initial state
  factory SignupState.empty() {
    return SignupState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  factory SignupState.loading() {
    return SignupState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false);
  }
  factory SignupState.failure() {
    return SignupState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false);
  }
  factory SignupState.success() {
    return SignupState(
        isEmailValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false);
  }

  SignupState update({
    isEmailValid,
    isPasswordValid,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  SignupState copyWith({
    isEmailValid,
    isPasswordValid,
    isSubmitting,
    isSubmitEnabled,
    isSuccess,
    isFailure,
  }) {
    return SignupState(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
      isFailure: isFailure,
    );
  }
}
