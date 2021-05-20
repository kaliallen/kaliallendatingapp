import 'package:flutter/material.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';
import 'package:kaliallendatingapp/screens/profilesetup/ProfileGender.dart';
import 'package:kaliallendatingapp/widgets/StyledButton.dart';

class ProfileName extends StatelessWidget {

  final UserRepository _userRepository;
  final userId;

  ProfileName({@required UserRepository userRepository, String userId})
      : assert(userRepository != null),
        _userRepository = userRepository,
        userId = userId;

  @override
  Widget build(BuildContext context) {
    String lastName;
    String firstName;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Container(
                child: Column(
                  children: [
                    Text(
                      'What\'s your name?',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'First Name',
                      ),
                      onChanged: (value){
                        firstName = value;
                      },
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Last Name'
                      ),
                      onChanged: (value){
                        lastName = value;
                      },
                    ),
                    StyledButton(
                      text: 'Continue',
                      color: Colors.grey,
                      onTap: (){
                        _userRepository.firstName = firstName;
                        _userRepository.lastName = lastName;

                        //_userRepository.firstName = firstName;
                        //_userRepository.lastName = lastName;
                       Navigator.push(context, MaterialPageRoute(
                           builder: (context)=> ProfileGender(
                               userRepository: _userRepository,
                           )));
                      },
                    ),
                  ],
                )
            ),
          ),
        ),
      ),
    );
  }
}
