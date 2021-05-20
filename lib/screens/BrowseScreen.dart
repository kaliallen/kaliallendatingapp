import 'package:flutter/material.dart';
import 'package:kaliallendatingapp/models/userRepository.dart';


class BrowseScreen extends StatefulWidget {
  final String userId;


  BrowseScreen({this.userId});


  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Browse'),
      ),
      body: Text('${widget.userId}'),

    );
  }
}
