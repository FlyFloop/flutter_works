part of 'bloclogin_bloc.dart';

/*
email changed
password changed
credential the button has been pressed
*/
@immutable
abstract class BlocloginEvent extends Equatable {
  const BlocloginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends BlocloginEvent {
  final String email;
  EmailChanged({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email: $email }';
}

class PasswordChanged extends BlocloginEvent {
  final String password;
  PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class Submitted extends BlocloginEvent {
  final String email;
  final String password;
  Submitted({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() => 'Submitted { email: $email, password: $password }';
}

class LoginWithCredentialsPressed extends BlocloginEvent {
  final String email;
  final String password;

  LoginWithCredentialsPressed({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
