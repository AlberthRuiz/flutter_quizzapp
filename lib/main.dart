import 'package:flutter/material.dart';
import 'package:quizzapp/models/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
    home: QuizPage(),
    debugShowCheckedModeBanner: false,
  ));
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  _QuizPage createState() => _QuizPage();
}

class _QuizPage extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();

  Alert respuestaCorrecta() {
    return Alert(
      context: context,
      type: AlertType.success,
      title: "Correcto!",
      desc: "Respuesta Correcta",
      buttons: [
        DialogButton(
          child: Text(
            "Continuar",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    );
  }

  Alert respuestaIncorrecta() {
    return Alert(
      context: context,
      type: AlertType.error,
      title: "Incorrecto!",
      desc: "No es la respuesta correcta",
      buttons: [
        DialogButton(
          child: Text(
            "Siguiente",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    );
  }

  Alert reset() {
    return Alert(
      context: context,
      type: AlertType.info,
      title: "Info Alert",
      desc: "This is an info alert with two actions.",
      buttons: [
        DialogButton(
          child: Text(
            "Reinicar",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          onPressed: () {
            quizBrain.restart();
            Navigator.pop(context);
          },
          color: Colors.green,
        ),
        DialogButton(
          child: Text(
            "Cerrar",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.blue,
        ),
      ],
    );
  }

  comprobarRespuesta() {
    if (quizBrain.isFinished()) {
      reset().show();
    } else {
      quizBrain.checkAnswer(true)
          ? respuestaCorrecta().show()
          : respuestaIncorrecta().show();
    }

    quizBrain.nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2d42),
      appBar: AppBar(
        title: Text("QuizApp", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xff2b2d42),
        elevation: 10,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => setState(() {
                  comprobarRespuesta();
                }),
                child: Text("Verdadero"),
                color: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () => setState(() {
                  comprobarRespuesta();
                }),
                child: Text("Falso"),
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
