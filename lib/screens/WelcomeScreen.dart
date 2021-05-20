import 'package:flutter/material.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';
import 'package:kaliallendatingapp/screens/PhoneSignUp.dart';
import 'package:kaliallendatingapp/widgets/StyledButton.dart';


class WelcomeScreen extends StatelessWidget {
  static String id = 'welcome_screen';
  final UserRepository _userRepository;

  WelcomeScreen({@required UserRepository userRepository})
  : assert(userRepository !=null),
  _userRepository = userRepository;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child:
                    Text('dayzie',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          // letterSpacing: 2.0,
                          fontSize: 61.0,
                          fontFamily: 'RobotoBlack',
                          fontWeight: FontWeight.w700,
                          foreground: Paint()..shader = LinearGradient(colors: <Color>[Color(0xffc200fb), Color(0xfffe4a49)],
                          ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                        )
                    ),),
                  SizedBox(height: 10.0),
                  Text('Something here that could be a tagline',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      // letterSpacing: 2.0,
                      fontSize: 20.0,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w900,
                      color:
                      Colors.grey
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                padding: EdgeInsets.all(40.0),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyledButton(
                      text: 'CONTINUE',
                      color: Colors.red,
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneSignUp(userRepository: _userRepository)));
                      },
                    ),
                    SizedBox(height: 15.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
