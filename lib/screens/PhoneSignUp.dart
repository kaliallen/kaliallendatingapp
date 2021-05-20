import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaliallendatingapp/authentification/authentification_bloc.dart';
import 'package:kaliallendatingapp/authentification/authentification_event.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';
import 'package:kaliallendatingapp/screens/CodeScreen.dart';
import 'package:kaliallendatingapp/screens/HomeScreen.dart';
import 'package:kaliallendatingapp/widgets/StyledButton.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../constants.dart';

class PhoneSignUp extends StatefulWidget {
  static String id = 'PhoneSignUp';
  final UserRepository _userRepository;

  PhoneSignUp({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  _PhoneSignUpState createState() => _PhoneSignUpState();
}

class _PhoneSignUpState extends State<PhoneSignUp> {
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(icon: Icon(Icons.close,
                        color: Colors.grey,), onPressed: () {
                        //TODO: Change this back to Navigator.pop when done with testing
                        BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
                       // Navigator.pop(context);
                      }),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                      'What\'s your phone number?',
                      style: TextStyle(
                        // letterSpacing: 2.0,
                        fontSize: 40.0,
                        fontFamily: 'RobotoBlack',
                        fontWeight: FontWeight.w900,
                        color: Colors.deepOrangeAccent,
                      )
                  ),
                  TextField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      hoverColor: Colors.white,
                      border: OutlineInputBorder(
                      ),
                      labelText: 'Mobile Number',
                      prefixText: '+1',
                    ),
                  ),
                  SizedBox(height: 20.0),
                  StyledButton(
                    text: 'Next',
                    color: Colors.lime,
                    onTap: () {
                      String phoneNumber = '+1' + _phoneNumberController.text.toString().trim();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context)=>CodeScreen(phone: phoneNumber, userRepository: widget._userRepository)));
                    },
                  ),
                ],
              ),
            ),
          ),
    ),
    ),
    );
  }
  }
