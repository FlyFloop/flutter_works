import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'blosearch_event.dart';
part 'blosearch_state.dart';

class BlosearchBloc extends Bloc<BlosearchEvent, BlosearchState> {
  BlosearchBloc() : super(BlosearchInitial()) {
    on<BlosearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
