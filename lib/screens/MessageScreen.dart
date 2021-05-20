import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  static String id = 'message_screen';
  final String userId;

  const MessageScreen({this.userId});

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Messages'),
      ),
    );
  }
}