import 'package:flutter/material.dart';

import '../widgets/appHeader.dart';

class ResultScreen extends StatefulWidget {
  static const routeName = "/Result";

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int noOfRight = 0;
  int noOfWrong = 0;
  double percentage = 0;
  Function resetQuiz;

  @override
  void didChangeDependencies() {
    var arguements =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    noOfRight = arguements['noOfRight'];
    noOfWrong = arguements['noOfWrong'];
    resetQuiz = arguements['resetQuiz'];
    double total = noOfRight / (noOfRight + noOfWrong);
    percentage = total * 100;
    print(noOfRight);
    super.didChangeDependencies();
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
          margin: EdgeInsets.only(top: 20, right: 60, left: 60),
          child: Column(
            children: [
              AppHeader(),
              SizedBox(
                height: 30,
              ),
              Text("No of Correctly answered Questions:" + noOfRight.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text("No of Wrongly answered Questions:" + noOfWrong.toString(),
                  style: TextStyle(fontSize: 15, color: Colors.white)),
              SizedBox(
                height: 10,
              ),
              Text("Your Total Score:" + (noOfRight * 10).toString(),
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              SizedBox(
                height: 30,
              ),
              Text("Your Percentage:",
                  style: TextStyle(fontSize: 25, color: Colors.white)),
              SizedBox(
                height: 20,
              ),
              Text(percentage.toStringAsFixed(2) + "%",
                  style: TextStyle(fontSize: 25, color: Colors.teal[900])),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                onPressed: resetQuiz,
                child: Text(
                  "Reset Quiz",
                  style: TextStyle(fontSize: 20, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
