part of 'auh_bloc_bloc.dart';

abstract class AuhBlocState extends Equatable {
  const AuhBlocState();

  @override
  List<Object> get props => [];
}

class AuhBlocUnInitial extends AuhBlocState {}

class AuhBlocAuthenticated extends AuhBlocState {
  //Authenticated state

  final String userId;

  AuhBlocAuthenticated(this.userId);

  @override
  List<Object> get props => [userId];

  @override
  String toString() => 'AuhBlocAuthenticated { userId: $userId }';
}

class AuhBlocAuthenticatedButNotSet extends AuhBlocState {
//your email and password has been accepted and you still need to give us details
  String userId;
  AuhBlocAuthenticatedButNotSet(this.userId);
  @override
  List<Object> get props => [userId];
}

class AuhBlocUnAuthenticated extends AuhBlocState {
  //UnAuthenticated state

}
