import 'package:flutter/material.dart';
import '../classes/message.dart';

class Chat extends StatefulWidget {
  const Chat({ Key key }) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  List<Message> messages= [
    Message('user', 'hi'),
    Message('bot', 'Hi there! how can I help you?'),
    Message('user', 'Where is you address'),
    Message('bot', 'It is new york 21st avenue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat')
      )
    );
  }
}