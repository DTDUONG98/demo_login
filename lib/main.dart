import 'package:demo_login/home_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "",
      home: HomePage(),
    );
  }
}
