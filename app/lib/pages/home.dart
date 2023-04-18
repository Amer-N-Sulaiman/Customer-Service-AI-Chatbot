import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          child: Column(
              children: [
                Text('Welcome to our store',
                  style: TextStyle(fontSize: 40),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height:20),
                Text('Click the button bellow to chat with our chatbot', 
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
                SizedBox(height: 40),
                ElevatedButton.icon(icon: Icon(Icons.chat), label: Text('chat with me'), style: ButtonStyle(padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 20, horizontal: 30))),
                  onPressed: (){
                    Navigator.pushNamed(context, '/chat');
                  },
                ),
              ],
          ),
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0)
        ),
      ),
      
    );
  }
}