import 'package:flutter/material.dart';
import '../classes/message.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/scheduler.dart';
import '../classes/sentencePreparer.dart';
// import 'package:tflite/tflite.dart';
// import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import '../classes/chatModel.dart';
import 'package:flutter/services.dart';








class Chat extends StatefulWidget {
  const Chat({ Key key }) : super(key: key);
  @override
  State<Chat> createState() => _ChatState();

}

class _ChatState extends State<Chat> {

  List<Message> messages= [
    // Message('bot', 'Hi there! how can I help you?'),
    // Message('user', 'Where is you address'),
    // Message('bot', 'It is new york 21st avenue'),
    // Message('bot', 'Hi there! how can I help you?'),
    // Message('user', 'Where is you address'),
    // Message('bot', 'It is new york 21st avenue'),
    // Message('bot', 'Hi there! how can I help you?'),
    // Message('user', 'Where is you address'),
    // Message('bot', 'It is new york 21st avenue'),
    // Message('bot', 'Hi there! how can I help you?'),
    // Message('user', 'Where is you address'),
    // Message('bot', 'It is new york 21st avenue'),
    // Message('bot', 'Hi there! how can I help you?'),
    // Message('user', 'Where is you address'),
    // Message('bot', 'It is new york 21st avenue'),
    // Message('bot', 'Hi there! how can I help you?'),
    // Message('user', 'Where is you address'),
    // Message('bot', 'It is new york 21st avenue'),
  ];

  ScrollController listScrollController = ScrollController();
  final messageTextController = TextEditingController();
  ChatModel chatModel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // final interpreter = await tfl.Interpreter.fromAsset('your_model.tflite');
    print('before chat model');
    chatModel = ChatModel();
    print('chatModel: ');
    print(chatModel);

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
        color: messages[i].sender=='bot' ? Color(0xFFE8E8EE) : Color(0xFF1B97F3),
        tail: true,
        isSender: messages[i].sender=='user'
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
                                  border: InputBorder.none
                              ),
                              controller: messageTextController,
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
                      onTap: () async {
                        String message = messageTextController.text;
                        messageTextController.text = '';
                        // SentencePreparer preparer = SentencePreparer();
                        // List preparedMessage = preparer.prepareSentence(message);

                        // TensorBuffer probabilityBuffer = TensorBuffer.fromList();

                        // print(preparedMessage.shape);
                        print(message);
                        String pred = chatModel.classify(message);

                        setState((){
                          messages.add(Message('user', message));
                          messages.add(Message('bot', pred));
                        });

                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          final position = listScrollController.position.maxScrollExtent;
                          listScrollController.jumpTo(position);
                        });
                        
                        



                        // print('scrolled');
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