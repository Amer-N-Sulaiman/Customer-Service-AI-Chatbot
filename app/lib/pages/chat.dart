import 'package:flutter/material.dart';
import '../classes/message.dart';
import 'package:chat_bubbles/chat_bubbles.dart';



class Chat extends StatefulWidget {
  const Chat({ Key key }) : super(key: key);
  @override
  State<Chat> createState() => _ChatState();

}

class _ChatState extends State<Chat> {

  List<Message> messages= [
    Message('bot', 'Hi there! how can I help you?'),
    Message('user', 'Where is you address'),
    Message('bot', 'It is new york 21st avenue'),
    Message('bot', 'Hi there! how can I help you?'),
    Message('user', 'Where is you address'),
    Message('bot', 'It is new york 21st avenue'),
    Message('bot', 'Hi there! how can I help you?'),
    Message('user', 'Where is you address'),
    Message('bot', 'It is new york 21st avenue'),
    Message('bot', 'Hi there! how can I help you?'),
    Message('user', 'Where is you address'),
    Message('bot', 'It is new york 21st avenue'),
    Message('bot', 'Hi there! how can I help you?'),
    Message('user', 'Where is you address'),
    Message('bot', 'It is new york 21st avenue'),
    Message('bot', 'Hi there! how can I help you?'),
    Message('user', 'Where is you address'),
    Message('bot', 'It is new york 21st avenue'),
  ];

  ScrollController listScrollController = ScrollController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      // do something
      final position = listScrollController.position.maxScrollExtent;
      listScrollController.jumpTo(position);
    });
  }


  @override
  Widget build(BuildContext context) {


    List<Widget> messageWidgets = [
      SizedBox(height: 20)
    ];
    for (int i=0; i<messages.length; i++){
      Widget messageWidget = BubbleSpecialThree(
        text: "${messages[i].body}",
        color: i%2==0 ? Color(0xFFE8E8EE) : Color(0xFF1B97F3),
        tail: true,
        isSender: i%2==0 ? false : true,
      );

      messageWidgets.add(messageWidget);
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('Chat')
      ),
      body: Column(
        children: [
          Expanded(flex: 9, child: ListView(
            controller: listScrollController,

            children: messageWidgets,
          )),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(15.0),
              height: 61,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35.0),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 5,
                              color: Colors.grey)
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Type Something... ",
                                  hintStyle: TextStyle( color:     Colors.blueAccent),
                                  border: InputBorder.none),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        color: Colors.blueAccent, shape: BoxShape.circle),
                    child: InkWell(
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      onTap: () {
                      },
                    ),
                  )
                ],
              ),
            ) ,
          ),
        ]
      )
    );
  }
}