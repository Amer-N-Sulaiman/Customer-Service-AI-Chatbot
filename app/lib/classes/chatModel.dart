import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:flutter/services.dart';
import '../classes/sentencePreparer.dart';
import 'dart:math';





class ChatModel {

  final _modelFile = 'tflite_chatbot_model.tflite';
  final _vocabFile = 'tags.txt';

  Interpreter _interpreter;
  var _labels = ['address',
    'delivery',
    'goodbye',
    'greeting',
    'items',
    'payments',
    'thanks',];

  var _responses = {
    "greeting": [
      "Hey :-) How can I help you?",
      "Hello, thanks for visiting, how can I help you?",
      "Hi there, what can I do for you?",
      "Hi there, how can I help?"
    ],

    "goodbye": [
      "See you later, thanks for visiting",
      "Have a nice day",
      "Bye! Come back again soon."
    ],

    "thanks": ["Happy to help!", "Any time!", "My pleasure"],

    "items": [
      "We sell Graphical Processing Units (GPU)",
      "We have Graphical Processing Units (GPU)"
    ],

    "payments": [
      "We accept VISA, Mastercard and Paypal",
      "We accept most major credit cards, and Paypal"
    ],

    "delivery": [
      "Delivery takes 2-4 days",
      "Shipping takes 2-4 days"
    ],

    "address": [
      "We're located at 550 1st Ave, New York, NY 10016, USA",
      "We're in 550 1st Ave, New York, NY 10016, USA."
    ]
  };


  ChatModel() {
    _loadModel();
  }

  void _loadModel() async{
    _interpreter = await Interpreter.fromAsset(_modelFile);
    print(_interpreter);
  }

  // void _loadDictionary() async {
  //   final vocab = await rootBundle.loadString('assets/$_vocabFile');
  //   var dict = <String, int>{};
  //   final vocabList = vocab.split('\n');
  //   for (var i = 0; i < vocabList.length; i++) {
  //     var entry = vocabList[i].trim().split(' ');
  //     dict[entry[0]] = int.parse(entry[1]);
  //   }
  //   _dict = dict;
  //   print('Dictionary loaded successfully');
  // }

  String classify(String message){
    SentencePreparer preparer = SentencePreparer();
    List preparedMessage = preparer.prepareSentence(message);
    // input shape: [60]
    // output shape: [7]
    var output = List<double>.filled(7, 0).reshape([1, 7]);
    print(output);
    print(preparedMessage);
    _interpreter.run(preparedMessage, output);
    print('after run');
    var maxOutput = -100.0;
    var maxOutputIdx = 0;
    print('output shape********');
    print(output.shape);
    print(output);
    for (int i=0; i<output[0].length; i++){
      if (output[0][i]>maxOutput){

        maxOutput = output[0][i];
        maxOutputIdx = i;
      }
    }
    var predictedLabel = _labels[maxOutputIdx];
    var responses = _responses[predictedLabel];
    var randomResponse = getRandomElement(responses);
    return randomResponse;
  }

  T getRandomElement<T>(List<T> list) {
    final random = new Random();
    var i = random.nextInt(list.length);
    return list[i];
  }
}