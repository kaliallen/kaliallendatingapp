import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kaliallendatingapp/screens/profilesetup/ProfileName.dart';
import 'package:kaliallendatingapp/widgets/StyledButton.dart';

class ProfileBirthday extends StatefulWidget {
  final UserRepository _userRepository;
  final userId;




 ProfileBirthday({@required UserRepository userRepository, String userId})
     : assert(userRepository != null),
       _userRepository = userRepository,
       userId = userId;

  @override
  _ProfileBirthdayState createState() => _ProfileBirthdayState();
}

class _ProfileBirthdayState extends State<ProfileBirthday> {

  bool isAdult(DateTime birthDate) {
    DateTime today = DateTime.now();
    DateTime adultDate = DateTime(birthDate.year + 18, birthDate.month, birthDate.day);
    return adultDate.isBefore(today);
  }

  DateTime _age;
  DateTime ofAge = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.wb_cloudy,
                      ),
                    ],
                  ),
                  Text(
                      'What\'s your birthday ${_age}?',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      child: Text(
                        _age == null ? " Year / Month / Day " : '${_age.year} / ${_age.month} / ${_age.day}'
                      ),
                    ),
                    onTap: (){
                      DatePicker.showDatePicker(context,
                      showTitleActions: false,
                      onChanged: (date){
                        print('change $date');
                        setState(() {
                          _age = date;
                        });
                      });
                    },
                  ),
                  Divider(),
                  StyledButton(
                    text: 'Continue',
                    color: Colors.grey,
                    onTap: () {
                      if (_age != null && isAdult(_age) == true) {
                        widget._userRepository.age = _age;
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) =>
                            ProfileName(
                                userRepository: widget._userRepository
                            )));
                      } else {
                        print('Cant proceed because not old enough...');
                      }
                    }
                  ),
                  Text(
                    _age != null && isAdult(_age) == false ? 'Must be 18 years or older to continue': ' ',
                    style: TextStyle(
                      color: Colors.red,
                    )
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
