import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  final String userId;

  const NotificationScreen({this.userId});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Notifications'),
      ),
    );
  }
}
