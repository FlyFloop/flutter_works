import 'package:flutter/material.dart';

@immutable
class ProfileState {
  final bool isPhotoEmpty;
  final bool isNameEmpty;
  final bool isAgeEmpty;
  final bool isGenderEmpty;
  final bool isInterestedEmpty;
  final bool isLocationEmpty;
  final bool isFailure;
  final bool isSubmitting;
  final bool isSuccess;

  ProfileState(
      this.isPhotoEmpty,
      this.isNameEmpty,
      this.isAgeEmpty,
      this.isGenderEmpty,
      this.isInterestedEmpty,
      this.isLocationEmpty,
      this.isFailure,
      this.isSubmitting,
      this.isSuccess);

  bool get isFormValid =>
      isPhotoEmpty &&
      isNameEmpty &&
      isAgeEmpty &&
      isGenderEmpty &&
      isInterestedEmpty &&
      isLocationEmpty;
  factory ProfileState.empty() {
    return ProfileState(
      false,
      true,
      true,
      true,
      true,
      true,
      false,
      false,
      false,
    );
  }
  factory ProfileState.loading() {
    return ProfileState(
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      true,
      false,
    );
  }
  factory ProfileState.failure() {
    return ProfileState(
      false,
      false,
      false,
      false,
      false,
      false,
      true,
      false,
      false,
    );
  }
  factory ProfileState.success() {
    return ProfileState(
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      true,
    );
  }
  ProfileState update({
    isPhotoEmpty,
    isNameEmpty,
    isAgeEmpty,
    isGenderEmpty,
    isInterestedEmpty,
    isLocationEmpty,
    isFailure,
    isSubmitting,
    isSuccess,
  }) {
    return copyWith(
      isPhotoEmpty: isPhotoEmpty,
      isNameEmpty: isNameEmpty,
      isAgeEmpty: isAgeEmpty,
      isGenderEmpty: isGenderEmpty,
      isInterestedEmpty: isInterestedEmpty,
      isLocationEmpty: isLocationEmpty,
      isFailure: isFailure,
      isSubmitting: isSubmitting,
      isSuccess: isSuccess,
    );
  }

  ProfileState copyWith({
    isPhotoEmpty,
    isNameEmpty,
    isAgeEmpty,
    isGenderEmpty,
    isInterestedEmpty,
    isLocationEmpty,
    isFailure,
    isSubmitting,
    isSuccess,
  }) {
    return ProfileState(
      isPhotoEmpty ?? this.isPhotoEmpty,
      isNameEmpty ?? this.isNameEmpty,
      isAgeEmpty ?? this.isAgeEmpty,
      isGenderEmpty ?? this.isGenderEmpty,
      isInterestedEmpty ?? this.isInterestedEmpty,
      isLocationEmpty ?? this.isLocationEmpty,
      isFailure ?? this.isFailure,
      isSubmitting ?? this.isSubmitting,
      isSuccess ?? this.isSuccess,
    );
  }
}
