import 'package:flutter/material.dart';
import '../widgets/mathOperator.dart';
import '../widgets/appHeader.dart';

class MainScreen extends StatelessWidget {
  static const routeName = "/mainScreen";
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
              MathOperator(
                  operatorType: "ADDITION",
                  icon: Icon(Icons.add, color: Colors.green[200])),
              SizedBox(
                height: 20,
              ),
              MathOperator(
                  operatorType: "SUBTRACTION",
                  icon: Icon(Icons.remove, color: Colors.green[200])),
              SizedBox(
                height: 20,
              ),
              MathOperator(
                  operatorType: "MULTIPLICATION",
                  icon: Icon(
                    Icons.close_sharp,
                    color: Colors.green[200],
                  )),
              SizedBox(
                height: 20,
              ),
              MathOperator(
                  operatorType: "DIVISION",
                  icon: Icon(Icons.add, color: Colors.green[200])),
            ],
          ),
        ),
      ),
    );
  }
}
