import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('界面三'), 
      ),
      body: Center(
        child: Text(
          '界面三',
          style: TextStyle(
            fontSize: 30,
            color: Colors.blue 
          ), 
        ), 
      ),
    );
  }
}