import 'package:flutter/material.dart';

class CompanyHotJob extends StatelessWidget {
  const CompanyHotJob({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: new Row(
        children: <Widget>[
          RichText(
              text: new TextSpan(
                  text: '1',
                  style: TextStyle(fontSize: 16.0, color: Colors.black),
                  children: [
                TextSpan(
                  text: '2',
                  style: TextStyle(fontSize: 16.0, color: Colors.red),
                ),
                TextSpan(
                  text: '3',
                  style: TextStyle(fontSize: 22.0, color: Colors.blue),
                ),
              ]))
        ],
      ),
    ));
  }
}
