part of 'bloc_signup_bloc.dart';

/*
email changed
password changed
credential the button has been pressed
*/

@immutable
abstract class BlocSignupEvent extends Equatable {
  const BlocSignupEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends BlocSignupEvent {
  final String email;
  EmailChanged({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email: $email }';
}

class PasswordChanged extends BlocSignupEvent {
  final String password;
  PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends BlocSignupEvent {
  final String email;
  final String password;
  Submitted({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'Submitted { email: $email, password: $password }';
}

class SignupWithCredentialsPressed extends BlocSignupEvent {
  final String email;
  final String password;

  SignupWithCredentialsPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
