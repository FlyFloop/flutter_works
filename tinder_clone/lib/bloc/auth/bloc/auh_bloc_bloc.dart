import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tinder_clone/repositories/user_repository.dart';

part 'auh_bloc_event.dart';
part 'auh_bloc_state.dart';

class AuhBlocBloc extends Bloc<AuhBlocEvent, AuhBlocState> {
  //checking and updating the user auth states and response to events
  final UserRepository userRepository;

  @override
  AuhBlocState get initialState => AuhBlocUnInitial();

  AuhBlocBloc({required this.userRepository})
      : super(AuhBlocUnAuthenticated()) {
    on<AuhBlocEvent>(
      (event, emit) => event,
    );
  }

  Stream<AuhBlocState> _mapEventToState(
    //this is the event handler
    AuhBlocEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuhBlocState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await userRepository.isSignedIn();
      if (isSignedIn) {
        final uid = await userRepository.getUser();
        final isFirstTime = await userRepository.isFirstTime(uid);
        if (!isFirstTime) {
          yield AuhBlocAuthenticatedButNotSet(uid);
        } else {
          yield AuhBlocAuthenticated(uid);
        }
      } else {
        yield AuhBlocUnAuthenticated();
      }
    } catch (e) {
      yield AuhBlocUnAuthenticated();
    }
  }

  Stream<AuhBlocState> _mapLoggedInToState() async* {
    final isFirstTime =
        await userRepository.isFirstTime(await userRepository.getUser());

    if (!isFirstTime) {
      yield AuhBlocAuthenticatedButNotSet(await userRepository.getUser());
    } else {
      yield AuhBlocAuthenticated(await userRepository.getUser());
    }
  }

  Stream<AuhBlocState> _mapLoggedOutToState() async* {
    yield AuhBlocUnAuthenticated();
    userRepository.signOut();
  }
}
