import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionno = 0;
  List<Widget> scorekeeper = [];
  List<String> questions = [];
  List<bool> answers = [];
  @override
  void initState() {
    temp();
    super.initState();
  }

  void temp() {
    Question('Some cats are actually allergic to humans', true);
    Question('You can lead a cow down stairs but not up stairs.', false);
    Question('Approximately one quarter of human bones are in the feet.', true);
    Question('A slug\'s blood is green.', true);
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true);
    Question('It is illegal to pee in the Ocean in Portugal.', true);
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false);
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true);
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false);
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true);
    Question('Google was originally called \"Backrub\".', true);
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true);
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true);
  }

  void Question(String question, bool ans) {
    questions.add(question);
    answers.add(ans);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionno],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                if (questionno < questions.length - 1) {
                  if (answers[questionno] == true) {
                    setState(() {
                      scorekeeper.add(
                        rightans(),
                      );
                    });
                  } else {
                    setState(() {
                      scorekeeper.add(
                        wrongans(),
                      );
                    });
                  }
                  questionno++;
                } else {
                  setState(() {
                    if (questions[questionno] != 'You Are Done With The Quiz') {
                      if (answers[questionno] == true)
                        scorekeeper.add(rightans());
                      else
                        scorekeeper.add(wrongans());
                    }
                    questions[questionno] = 'You Are Done With The Quiz';
                  });
                }

                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (questionno < questions.length - 1) {
                  if (answers[questionno] == false) {
                    setState(() {
                      scorekeeper.add(
                        rightans(),
                      );
                    });
                  } else {
                    setState(() {
                      scorekeeper.add(
                        wrongans(),
                      );
                    });
                  }
                  questionno++;
                } else {
                  setState(() {

                    deactivate();
                    if (questions[questionno] != 'You Are Done With The Quiz') {
                      if (answers[questionno] == true)
                        scorekeeper.add(wrongans());
                      else
                        scorekeeper.add(rightans());
                    }
                    questions[questionno] = 'You Are Done With The Quiz';
                  });
                }

                //The user picked false.
              },
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Row(
            children: scorekeeper,
          ),
        )
      ],
    );
  }

  Icon wrongans() {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }

  Icon rightans() {
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  }
}
