import 'package:flutter/material.dart';
import 'hepler.dart';

Helper questioPool = Helper();

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
  List<Icon> score = [];
  int scoreCount = 0;

  void popUpMessage() {
    var listLen = questioPool.len();
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        backgroundColor: Colors.amberAccent,
        title: const Text('Your Score Is: '),
        content: Text('$scoreCount/$listLen'),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                scoreCount = 0;
              },
              child: const Text('OK'),
            ),
          ),
        ],
      ),
    );
  }

  void trackAnswers(bool userAnswer) {
    bool theRightAnswer = questioPool.getQUestionAnswer();
    setState(() {
      if (!questioPool.isFinished()) {
        if (theRightAnswer == userAnswer) {
          scoreCount++;
          score.add(
            Icon(
              Icons.check,
              color: Colors.green,
            ),
          );
        } else {
          score.add(
            Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
        }
        questioPool.moveNextQuestion();
      } else {
        score.clear();
        // score = [];
        questioPool.reset();
        print('Restart');
        popUpMessage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // var nbrElements = questioPool.len();

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
                // quList[index].questionText.toString(),// non safty
                // quList[index].questionText!,
                questioPool.getQUestionText(),
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                // print(score.length);
                // print(questioPool.len());
                // print('======================');

                // if (score.length == questioPool.len() - 1)
                //   popUpMessage();
                // else
                trackAnswers(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              // color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                // The user picked false.

                trackAnswers(false);
              },
            ),
          ),
        ),
        //
        Row(
          children:
              // <Widget>[
              //   // if (score.length == 10) score.clear();
              score,
          //   (score.length == 10)
          //       ? Text(
          //           'this a test',
          //           style: TextStyle(
          //             color: Colors.blue,
          //           ),
          //         )
          //       : Text(
          //           score.length.toString(),
          //           style: TextStyle(
          //             color: Colors.blue,
          //           ),
          //         ),
          // ],
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
