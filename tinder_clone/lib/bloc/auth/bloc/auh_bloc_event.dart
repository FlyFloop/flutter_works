part of 'auh_bloc_bloc.dart';

/*
three things for bloc
state, events and bloc
*/
abstract class AuhBlocEvent extends Equatable {
  const AuhBlocEvent();

  @override
  List<Object> get props => []; //props is a list of objects
  //we have three events first one is appstarted, logged in, logged out
}

class AppStarted extends AuhBlocEvent {
  //this is the first event
  //when the app starts
  //we need to check if the user is already logged in
  //if yes then we need to show the logged in state
  //if not then we need to show the unauthenticated state
  @override
  List<Object> get props => [];
}

class LoggedIn extends AuhBlocEvent {
  //this is the second event
  //when the user is logged in
  //we need to show the authenticated state

  LoggedIn();
  @override
  List<Object> get props => [];
}

class LoggedOut extends AuhBlocEvent {
  //this is the third event
  //when the user is logged out
  //we need to show the unauthenticated state
  @override
  List<Object> get props => [];
}
