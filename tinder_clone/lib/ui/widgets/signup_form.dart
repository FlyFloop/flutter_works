import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_clone/bloc/signup/bloc/bloc_signup_bloc.dart';
import 'package:tinder_clone/repositories/user_repository.dart';
import 'package:tinder_clone/ui/constants.dart';

import '../../bloc/auth/bloc/auh_bloc_bloc.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key, required this.userRepository}) : super(key: key);
  final UserRepository userRepository;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  late BlocSignupBloc signupBloc;
  late String userid;
  UserRepository get userRepository => widget.userRepository;
  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isSignupButtonEnabled(SignupState state) {
    return isPopulated == true;
  }

  @override
  void initState() {
    signupBloc = BlocSignupBloc(userRepository: userRepository);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
    _getUserId();
    super.initState();
  }

  _onEmailChanged() {
    signupBloc.add(EmailChanged(email: _emailController.text));
  }

  _onPasswordChanged() {
    signupBloc.add(PasswordChanged(password: _passwordController.text));
  }

  _getUserId() async {
    userid = await userRepository.getUser();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _onFormSubmitted() {
    signupBloc.add(SignupWithCredentialsPressed(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener(
        bloc: signupBloc,
        listener: (BuildContext context, SignupState signupState) {
          if (signupState.isFailure) {
            Scaffold.of(context)
              ..showBottomSheet((context) {
                return Container(
                  height: size.height * 0.3,
                  child: Center(
                    child: Text(
                      "Signup Failed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                );
              });
          } else if (signupState.isSubmitting) {
            Scaffold.of(context)
              ..showBottomSheet((context) {
                return Container(
                  height: size.height * 0.3,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              });
          } else if (signupState.isSuccess) {
            //BlocProvider.of<AuhBlocBloc>.add(LoggedIn(userId));
            BlocProvider.of<AuhBlocBloc>(context).add(LoggedIn(userid));
            Navigator.of(context).pop();
          }
        },
        child: BlocBuilder(
          bloc: signupBloc,
          builder: (BuildContext context, SignupState signupState) {
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
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
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
                                borderSide: BorderSide(
                                    color: Colors.white, width: 1.0)),
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
                          onPressed: () => isSignupButtonEnabled(signupState)
                              ? _onFormSubmitted()
                              : null,
                          child: Text('Signup'),
                        ),
                      ),
                    ],
                  )),
            );
          },
        ));
  }
}
