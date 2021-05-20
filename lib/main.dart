import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaliallendatingapp/authentification/authentification_bloc.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';
import 'package:kaliallendatingapp/screens/Home.dart';
import 'package:kaliallendatingapp/screens/profilesetup/ProfileGender.dart';
import 'authentification/authentification_event.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final UserRepository _userRepository = UserRepository();

  runApp(BlocProvider(
    create: (context) => AuthenticationBloc(userRepository: _userRepository)..add(AppStarted()),
    child: Home(userRepository: _userRepository),
    //Home(userRepository: _userRepository),
  ));

}
