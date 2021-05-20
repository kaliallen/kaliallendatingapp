import 'package:kaliallendatingapp/authentification/authentification_bloc.dart';
import 'package:kaliallendatingapp/authentification/authentification_event.dart';
import 'package:kaliallendatingapp/authentification/authentification_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';
import 'package:kaliallendatingapp/screens/HomeScreen.dart';
import 'package:kaliallendatingapp/screens/PhoneSignUp.dart';
import 'package:kaliallendatingapp/screens/SplashScreen.dart';
import 'package:kaliallendatingapp/screens/profilesetup/ProfileSetup.dart';
import 'package:kaliallendatingapp/screens/WelcomeScreen.dart';



class Home extends StatelessWidget {
  static String id = 'home_id';
  final UserRepository _userRepository;

  Home({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.id : (context)=>Home(),
HomeScreen.id : (context)=>HomeScreen(),
PhoneSignUp.id : (context)=>PhoneSignUp(),
WelcomeScreen.id : (context)=>WelcomeScreen(),
},
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is Uninitialized) {
            return SplashScreen();
          }
          if (state is Authenticated) {
            return HomeScreen(
              userId: state.userId,
            );
          }
          if (state is AuthenticatedButNotSet) {
            return ProfileSetup(
              userRepository: _userRepository,
              userId: state.userId,
            );
          }
          if (state is Unauthenticated) {
            return WelcomeScreen(
              userRepository: _userRepository,
            );
          } else
            return Container();
        },
      ),
    );
  }
}