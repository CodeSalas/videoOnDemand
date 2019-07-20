import 'package:appmovieuplabs/src/Pages/LoginPage.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VidLive Videos',
      initialRoute: 'login',
      routes: {
        'login' : (BuildContext context) => LoginPage(),
      },
    );
  }
}