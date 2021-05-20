import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaliallendatingapp/authentification/authentification_bloc.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';
import 'package:kaliallendatingapp/screens/Home.dart';
import 'package:kaliallendatingapp/widgets/StyledButton.dart';
import 'package:kaliallendatingapp/authentification/authentification_state.dart';

class ProfileGender extends StatelessWidget {
  final UserRepository _userRepository;
  final userId;

  ProfileGender({@required UserRepository userRepository, String userId})
      : assert(userRepository != null),
        _userRepository = userRepository,
        userId = userId;


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Text('${_userRepository.lastName}'),
                Text('${_userRepository.firstName}'),
                Text('${_userRepository.age}'),
                StyledButton(
                  text: 'Complete Profile',
                  color: Colors.grey,
                  onTap: () async {
                    //Store data from userRepository to Firestore
                    //TODO: Check if user exists in users collection in database (according to their id)
                    //TODO: If the user doesn't exist, then we want to take them to the create account page
                    //TODO: Get username from create account, use it to make new user document in users collection
                    await _userRepository.createUserInFirestore(
                      userId: userId,
                      firstName: _userRepository.firstName,
                      lastName: _userRepository.lastName,
                      gender: _userRepository.gender,
                      age: _userRepository.age,
                    );
                    // if ( await _userRepository.isSignedIn() == true && ) {
                    //   BlocProvider.of<AuthenticationBloc>(context).add(
                    //       LoggedIn());
                    // }
                    //

                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            Home(userRepository: _userRepository)));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
