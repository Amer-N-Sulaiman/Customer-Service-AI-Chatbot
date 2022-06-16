import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/loading.dart';
import 'pages/chat.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Service Chatbot',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/home',
      routes:{
        '/home': (context) => Home(title: 'Customer Service Chat Bot'),
        '/chat': (context) => Chat(),
        '/loading': (context) => Loading(),
      },
    );
  }
}


