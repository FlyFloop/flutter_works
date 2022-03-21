import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auh_bloc_event.dart';
part 'auh_bloc_state.dart';

class AuhBlocBloc extends Bloc<AuhBlocEvent, AuhBlocState> {
  AuhBlocBloc() : super(AuhBlocInitial()) {
    on<AuhBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
