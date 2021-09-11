import 'package:flutter/material.dart';

import './Pages/LoginPage.dart';

void main() => runApp(new CafeMate());

class CafeMate extends StatefulWidget {
  @override
  _CafeMateState createState() => _CafeMateState();
}

class _CafeMateState extends State<CafeMate> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage()
    );
  }
}