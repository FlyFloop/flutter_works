part of 'auh_bloc_bloc.dart';

abstract class AuhBlocState extends Equatable {
  const AuhBlocState();
  
  @override
  List<Object> get props => [];
}

class AuhBlocInitial extends AuhBlocState {}
