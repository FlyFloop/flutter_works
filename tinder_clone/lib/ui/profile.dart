import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_clone/bloc/profile/bloc/blocprofile_bloc.dart';
import 'package:tinder_clone/repositories/user_repository.dart';
import 'package:tinder_clone/ui/constants.dart';
import 'package:tinder_clone/ui/widgets/profile_form.dart';

class Profile extends StatelessWidget {
  final UserRepository userRepository;
  final userId;
  const Profile({Key? key, required this.userRepository, required this.userId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: BlocProvider<BlocprofileBloc>(
        create: (context) => BlocprofileBloc(
          userRepository,
        ),
        child: ProfileForm(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
