import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaliallendatingapp/authentification/authentification_bloc.dart';
import 'package:kaliallendatingapp/authentification/authentification_event.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';
import 'package:kaliallendatingapp/screens/profilesetup/ProfileBirthdate.dart';
import 'package:kaliallendatingapp/widgets/StyledButton.dart';

class ProfileSetup extends StatelessWidget {
  final _userRepository;
  final userId;

  ProfileSetup({@required UserRepository userRepository, String userId})
      : assert(userRepository != null && userId != null),
        _userRepository = userRepository,
        userId = userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Setup"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.clear_rounded,
              color: Colors.white
            ),
            onPressed: (){
              BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());
            },
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.amber,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Text("Welcome to Dayzie! Here is a one-pager describing the app..."),
          StyledButton(
            text: 'Button to Profile Setup',
            color: Colors.grey,
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>
                      ProfileBirthday(
                          userRepository: _userRepository,
                      )));
            },
          ),
        ],
      ),
    );
  }
}