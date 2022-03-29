import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_clone/repositories/user_repository.dart';
import 'package:tinder_clone/ui/constants.dart';

import '../bloc/signup/bloc/bloc_signup_bloc.dart';
import 'widgets/signup_form.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key, required this.userrepository}) : super(key: key);

  final UserRepository userrepository;

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  late BlocSignupBloc signupBloc;

  UserRepository get userRepository => widget.userrepository;

  @override
  void initState() {
    signupBloc = BlocSignupBloc(userRepository: userRepository);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: BlocProvider<BlocSignupBloc>(
        create: (context) => BlocSignupBloc(userRepository: userRepository),
        child: SignupForm(userRepository: userRepository),
      ),
    );
  }
}
