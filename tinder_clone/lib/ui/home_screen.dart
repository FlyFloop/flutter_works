import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_clone/bloc/auth/bloc/auh_bloc_bloc.dart';
import 'package:tinder_clone/repositories/user_repository.dart';
import 'package:tinder_clone/ui/login.dart';
import 'package:tinder_clone/ui/profile.dart';
import 'package:tinder_clone/ui/signup.dart';
import 'package:tinder_clone/ui/splash_screen.dart';
import 'package:tinder_clone/ui/widgets/tabs.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final UserRepository _userRepository = UserRepository();
  late AuhBlocBloc _authBloc;

  @override
  void initState() {
    _authBloc = AuhBlocBloc(userRepository: _userRepository);
    try {
      _authBloc.add(AppStarted());
    } catch (e) {
      print(e.toString());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => _authBloc,
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocBuilder(
              bloc: _authBloc,
              builder: (BuildContext context, AuhBlocState state) {
                if (state is AuhBlocUnInitial) {
                  print(state);
                  return SplashScreen();
                }
                if (state is AuhBlocAuthenticated) {
                  return Tabs();
                }
                if (state is AuhBlocAuthenticatedButNotSet) {
                  return Profile(
                      userRepository: _userRepository, userId: state.userId);
                }
                if (state is AuhBlocUnAuthenticated) {
                  return Login(userrepository: _userRepository);
                } else {
                  print(state);
                  return Login(userrepository: _userRepository);
                }
              },
            )),
      ),
    );
  }
}
