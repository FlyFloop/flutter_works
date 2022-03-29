import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_clone/bloc/bloc_observer.dart';
import 'package:tinder_clone/ui/home_screen.dart';

import 'ui/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BlocObserver:
  SimpleBlocObserver(); //app know a simple bloc observer
  runApp(Home());
}
