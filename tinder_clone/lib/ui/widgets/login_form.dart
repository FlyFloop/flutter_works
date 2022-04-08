import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_clone/bloc/login/bloc/bloclogin_bloc.dart';
import 'package:tinder_clone/repositories/user_repository.dart';
import 'package:tinder_clone/ui/signup.dart';

import '../../bloc/auth/bloc/auh_bloc_bloc.dart';
import '../../bloc/login/bloc/bloclogin_state.dart';
import '../constants.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userrepository;
  const LoginForm({Key? key, required this.userrepository}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late BlocloginBloc loginBloc;

  UserRepository get userRepository => widget.userrepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return isPopulated == true;
  }

  @override
  void initState() {
    loginBloc = BlocProvider.of<BlocloginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    super.initState();
  }

  _onEmailChanged() {
    loginBloc.add(EmailChanged(email: _emailController.text));
  }

  _onPasswordChanged() {
    loginBloc.add(PasswordChanged(password: _passwordController.text));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _onFormSubmitted() {
    loginBloc.add(LoginWithCredentialsPressed(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<BlocloginBloc, LoginState>(
      listener: (BuildContext context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..showBottomSheet((context) {
              return Container(
                height: size.height * 0.3,
                child: Center(
                  child: Text(
                    "Login Failed",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              );
            });
        } else if (state.isSubmitting) {
          Scaffold.of(context)
            ..showBottomSheet((context) {
              return Container(
                height: size.height * 0.3,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            });
        } else if (state.isSuccess) {
          BlocProvider.of<AuhBlocBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<BlocloginBloc, LoginState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                color: backgroundColor,
                width: size.width,
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text('Tinder'),
                    ),
                    Container(
                      width: size.width * 0.8,
                      child: Divider(
                        height: size.height * 0.05,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 1.0)),
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: ElevatedButton(
                        onPressed: () async => isLoginButtonEnabled(state)
                            ? await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text)
                                .then((value) {
                                print('alper');
                              })
                            : null,
                        child: Text('Login'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(size.height * 0.02),
                      child: InkWell(
                        child: Text(
                          'New? Register Here',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    Signup(userrepository: userRepository)),
                          );
                        },
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
