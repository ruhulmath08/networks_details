import 'package:flutter/material.dart';

class MyTelephonyService extends StatefulWidget {

  @override
  _MyTelephonyServiceState createState() => new _MyTelephonyServiceState();
}

class _MyTelephonyServiceState extends State<MyTelephonyService> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('My Telephony Service'),
      ),
      body: new Container(),
    );
  }


}