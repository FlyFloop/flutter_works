import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_clone/bloc/login/bloc/bloclogin_bloc.dart';
import 'package:tinder_clone/repositories/user_repository.dart';
import 'package:tinder_clone/ui/constants.dart';
import 'package:tinder_clone/ui/widgets/login_form.dart';

import '../bloc/signup/bloc/bloc_signup_bloc.dart';
import 'widgets/signup_form.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.userrepository}) : super(key: key);

  final UserRepository userrepository;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
        title: Text('Login'),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: BlocProvider<BlocloginBloc>(
        create: (context) => BlocloginBloc(userRepository: userRepository),
        child: LoginForm(userrepository: userRepository),
      ),
    );
  }
}
