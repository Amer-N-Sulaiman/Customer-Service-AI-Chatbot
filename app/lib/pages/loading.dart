import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('loading ...'),
        ),
        body: Center(
          child: Container(
              child: Text('Loading ...')
          ),
      )
    );
  }
}