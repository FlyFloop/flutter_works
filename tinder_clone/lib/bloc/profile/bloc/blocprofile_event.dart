part of 'blocprofile_bloc.dart';

abstract class BlocprofileEvent extends Equatable {
  const BlocprofileEvent();

  @override
  List<Object> get props => [];
}

class NameChanged extends BlocprofileEvent {
  final String name;

  NameChanged({required this.name});

  @override
  List<Object> get props => [name];
}

class PhotoChanged extends BlocprofileEvent {
  final File photo;

  PhotoChanged({required this.photo});

  @override
  List<Object> get props => [photo];
}

class AgeChanged extends BlocprofileEvent {
  final int age;

  AgeChanged({required this.age});

  @override
  List<Object> get props => [age];
}

class GenderChanged extends BlocprofileEvent {
  final String gender;

  GenderChanged({required this.gender});

  @override
  List<Object> get props => [gender];
}

class InterestedInChanged extends BlocprofileEvent {
  final String interestedIn;

  InterestedInChanged({required this.interestedIn});

  @override
  List<Object> get props => [interestedIn];
}

class LocationChanged extends BlocprofileEvent {
  final GeoPoint location;

  LocationChanged({required this.location});

  @override
  List<Object> get props => [location];
}

class Submitted extends BlocprofileEvent {
  final String name, gender, interestedIn;
  final DateTime age;
  final GeoPoint location;
  final File photo;

  Submitted(this.name, this.gender, this.interestedIn, this.age, this.location,
      this.photo);

  @override
  List<Object> get props => [name, gender, interestedIn, age, location, photo];
}
