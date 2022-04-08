import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:tinder_clone/repositories/user_repository.dart';

import 'blocprofile_state.dart';

part 'blocprofile_event.dart';

class BlocprofileBloc extends Bloc<BlocprofileEvent, ProfileState> {
  UserRepository userRepository;
  BlocprofileBloc(this.userRepository) : super(ProfileState.empty()) {
    // ignore: void_checks
    on<BlocprofileEvent>((event, emit) async* {
      if (event is NameChanged) {
        yield* _mapNameChangedToState(event.name);
      } else if (event is AgeChanged) {
        yield* _mapAgeChangedToState(event.age);
      } else if (event is GenderChanged) {
        yield* _mapGenderChangedToState(event.gender);
      } else if (event is InterestedInChanged) {
        yield* _mapInterestedInChangedToState(event.interestedIn);
      } else if (event is PhotoChanged) {
        yield* _mapPhotoChangedToState(event.photo);
      } else if (event is LocationChanged) {
        yield* _mapLocationChangedToState(event.location);
      } else if (event is Submitted) {
        //final uid = await userRepository.getUser();
        // yield* _mapSubmittedToState();
      }
    });
  }
  Stream<ProfileState> _mapNameChangedToState(String name) async* {
    yield state.update(
      isNameEmpty: name,
    );
  }

  Stream<ProfileState> _mapAgeChangedToState(int age) async* {
    yield state.update(
      isAgeEmpty: age,
    );
  }

  Stream<ProfileState> _mapPhotoChangedToState(File photo) async* {
    yield state.update(
      isPhotoEmpty: photo,
    );
  }

  Stream<ProfileState> _mapLocationChangedToState(GeoPoint location) async* {
    yield state.update(
      isLocationEmpty: location,
    );
  }

  Stream<ProfileState> _mapGenderChangedToState(String gender) async* {
    yield state.update(
      isGenderEmpty: gender,
    );
  }

  Stream<ProfileState> _mapInterestedInChangedToState(
      String interestedIn) async* {
    yield state.update(
      isInterestedEmpty: interestedIn,
    );
  }

  Stream<ProfileState> _mapSubmittedToState(
      File photo,
      int age,
      String userId,
      String name,
      GeoPoint location,
      String interestedIn,
      String gender) async* {}
}
