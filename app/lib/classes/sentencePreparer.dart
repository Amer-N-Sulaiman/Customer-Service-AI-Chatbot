import 'package:stemmer/stemmer.dart';

class SentencePreparer {
  String sentence;
  List allWords = ["'s", 'a', 'accept', 'address', 'am', 'anyon', 'are', 'bye', 'can', 'card', 'cash', 'credit', 'day', 'deliveri', 'do', 'doe', 'expect', 'get', 'good', 'goodby', 'have', 'hello', 'help', 'hey', 'hi', 'how', 'i', 'is', 'item', 'kind', 'later', 'locat', 'long', 'lot', 'mastercard', 'method', 'my', 'of', 'onli', 'pay', 'payment', 'paypal', 'see', 'sell', 'ship', 'store', 'take', 'thank', 'that', 'the', 'there', 'to', 'wait', 'what', 'when', 'where', 'which', 'with', 'you', 'your'];


  List tokenize(String sentence){
    List tokenizedSentence = sentence.split(' ');
    return tokenizedSentence;
  }

  List stem(List tokenizedSentence){
    List stemmedSentence = [];
    PorterStemmer stemmer = PorterStemmer();
    for (int i=0; i<tokenizedSentence.length; i++){
      String stemmedWord = stemmer.stem(tokenizedSentence[i]);
      stemmedSentence.add(stemmedWord);
    }
    return stemmedSentence;
  }

  List wordsBag(List stemmedTokenizedSentence){
    List wordsBagList = [];
    for (int i=0; i<allWords.length; i++){
      if (stemmedTokenizedSentence.contains(allWords[i])){
        wordsBagList.add(1.0);
      } else{
        wordsBagList.add(0.0);
      }
    }
    return wordsBagList;
  }

  List prepareSentence(String sentence){
    List tokenizedSentence = this.tokenize(sentence);
    List stemmedTokenizedSentence = this.stem(tokenizedSentence);
    List wordsBag = this.wordsBag(stemmedTokenizedSentence);
    return wordsBag;
  }



}