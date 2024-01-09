import 'package:quizzapp/models/question.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<int> _shuffle = [];

  List<Question> _lstQuestions = [
    Question(questionText: "El hombre llegó a la luna?", questionAnswer: true),
    Question(
        questionText: "El número atómico del litio es 17",
        questionAnswer: false),
    Question(
        questionText: "La acrofobia es el miedo al ajo", questionAnswer: true),
    Question(
        questionText:
            "La Gran Muralla China es más larga que la distancia entre Londres y Pekín",
        questionAnswer: true),
    Question(
        questionText:
            "La única letra que no está en la tabla periódica es la letra J",
        questionAnswer: true)
  ];
  QuizBrain() {
    _shuffle = List<int>.generate(_lstQuestions.length, (i) => i)..shuffle();
  }
  String getQuestionText() {
    return _lstQuestions[returIndex()].questionText;
  }

  bool checkAnswer(bool answer) {
    return _lstQuestions[returIndex()].questionAnswer == answer;
  }

  nextQuestion() {
    _questionNumber++;
  }

  returIndex() {
    return _shuffle[_questionNumber >= _lstQuestions.length
        ? _lstQuestions.length - 1
        : _questionNumber];
  }

  isFinished() {
    return _questionNumber >= _lstQuestions.length;
  }

  restart() {
    _questionNumber = 0;
  }
}
