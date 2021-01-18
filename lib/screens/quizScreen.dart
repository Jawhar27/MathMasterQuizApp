import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mathquiz/screens/mainScreen.dart';
import '../screens/result.dart';

class QuizScreen extends StatefulWidget {
  static const routeName = '/quizScreen';

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  String question;
  List<int> optionList = [];
  int numOfCorrectAns = 0;
  int numOfWrongAns = 0;
  int totalQuestionsAsked = 0;
  bool isOver = false;
  int correctAns = 0;
  bool answeredRight = false;
  Object type1;
  Timer _timer;
  int _start = 60;

  @override
  void initState() {
    startCountDown();
    super.initState();
  }

  startCountDown() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start < 1) {
          _timer.cancel();
          Navigator.of(context).pushNamed(ResultScreen.routeName, arguments: {
            'noOfRight': numOfCorrectAns,
            'noOfWrong': numOfWrongAns,
            'resetQuiz': resetQuiz,
          });
        } else {
          _start = _start - 1;
        }
      });
    });
  }

  @override
  void didChangeDependencies() {
    var arguements =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    var type = arguements['type'];
    generateQuestions(type);
    super.didChangeDependencies();
  }

  resetQuiz() {
    setState(() {
      // List<int> optionList = [];
      numOfCorrectAns = 0;
      numOfWrongAns = 0;
      totalQuestionsAsked = 0;
    });
    Navigator.of(context).pushNamed(MainScreen.routeName);
  }

  generateQuestions(Object type) {
    Random random = Random();
    type1 = type;

    int second = random.nextInt(10) + 1;
    int first = random.nextInt(10) + second;

    if (type == "ADDITION") {
      question = '$first+$second ?';
      correctAns = first + second;
    }
    if (type == "SUBTRACTION") {
      question = '$first-$second ?';

      correctAns = first - second;
    }
    if (type == "MULTIPLICATION") {
      question = '$first*$second ?';
      correctAns = first * second;
    }
    if (type == "DIVISION") {
      question = '$first/$second ?';
      if (second == 0) {
        return;
      }
      correctAns = (first / second).floor();
    }

    int correctAnsLocation = random.nextInt(4);
    int inCorrectAns;
    for (int i = 0; i < 3; i++) {
      if (i == correctAnsLocation) {
        optionList.add(correctAns);
      }
      inCorrectAns = random.nextInt(20);
      while (correctAns == inCorrectAns) {
        inCorrectAns = random.nextInt(20);
      }
      optionList.add(inCorrectAns);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.lightGreen[400], Colors.blueGrey],
        )),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text(
                "math",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Text("master",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),
              Text(
                "Score:" + (numOfCorrectAns * 10).toString(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text("remaining Time:" + _start.toString() + "sec",
                  style: TextStyle(color: Colors.white)),
              SizedBox(
                height: 45,
              ),
              Text(question,
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(38),
                child: Container(
                  height: 330,
                  padding: EdgeInsets.only(bottom: 20, right: 25, left: 25),
                  child: GridView.builder(
                    itemCount: optionList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (optionList[index] == correctAns) {
                            print("Correct answer");

                            setState(() {
                              answeredRight = true;
                              print(type1);
                              optionList.clear();
                              generateQuestions(type1);
                              numOfCorrectAns++;
                            });
                          } else {
                            setState(() {
                              optionList.clear();
                              generateQuestions(type1);
                              numOfWrongAns++;
                              answeredRight = false;
                            });
                          }
                        },
                        child: Card(
                          child: Center(
                            child: Text(
                              optionList[index].toString(),
                              style: TextStyle(
                                  fontSize: 25, color: Colors.green[700]),
                            ),
                          ),
                        ),
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                  ),
                ),
              ),
              answeredRight
                  ? Text(
                      "Right Answer",
                      style: TextStyle(color: Colors.blue[900]),
                    )
                  : Text("")
            ],
          ),
        ),
      ),
    );
  }
}
