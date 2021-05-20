import 'package:flutter/material.dart';

class StyledButton extends StatelessWidget {

  final Function onTap;
  final String text;
  final Color color;

  StyledButton({this.onTap, this.color, this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(17.0)),
      ),
      child: GestureDetector(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              //Color(0xffeaeaea),
              fontSize: 15.0,
              fontFamily: 'Roboto',
              letterSpacing: 1.0,
              //fontWeight: FontWeight.w700,
            ),
          ),
        ),
        onTap: onTap,

      ),
    );
  }
}
